#coding=utf8

from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.forms.util import ErrorList
from django.core.urlresolvers import reverse

from datetime import date, timedelta, datetime

from xml_rpc_server.models import Office
import lib.conn as conn
from models import Order

def index(request):
    kwargs = {}
    
    from form import SearchForm
    if 'csrfmiddlewaretoken' in request.GET:
        initials = request.GET
    else:
        start_date = date.today()
        end_date = date.today() + timedelta(days=1)
        initials = {'offices': [o.id for o in Office.objects.filter(is_active=True)],
            'start_date': start_date, 'end_date': end_date}
    form = SearchForm(initials)
    if form.is_valid(): 
        brand_type=form.cleaned_data['brand_type']
        class_type=form.cleaned_data['class_type']
        start_date=form.cleaned_data['start_date']
        end_date=form.cleaned_data['end_date']
        if brand_type != "":
            kwargs['brand_type'] = brand_type
        if class_type != "":
            kwargs['class_type'] = class_type
            
        
        brand_type=form.cleaned_data['brand_type']
        class_type=form.cleaned_data['class_type']
        office_ids = form.cleaned_data['offices'] or []
        offices = Office.objects.filter(is_active=True, pk__in=office_ids)
    else:
        offices = Office.objects.filter(is_active=True)
    
    request.session['start_date'] = start_date.strftime("%Y-%m-%d")
    request.session['end_date'] = end_date.strftime("%Y-%m-%d")
    car_list = []
    errors = form._errors.setdefault("offices", ErrorList())
    for office in offices:
        try:
            rpc_srv = conn.TimeoutServerProxy(office.xmlrpc, timeout=2)
            for car in rpc_srv.get_cars(kwargs, start_date.strftime("%Y-%m-%d"), end_date.strftime("%Y-%m-%d")):
                car['office'] = office.name;
                car_list.append(car)
                
        except Exception, exc:
            errors.append(u"Офис %s не ответил." % office.name + str(exc))
            office.de_activate()
            pass
    
    paginator = Paginator(car_list, 9)
    page = request.GET.get('page')
    try:
        cars = paginator.page(page)
    except PageNotAnInteger:
        cars = paginator.page(1)
    except EmptyPage:
        cars = paginator.page(paginator.num_pages)
    
    queries = request.GET.copy()
    if queries.has_key('page'):
        del queries['page']
    
    return render(request, 'catalog/index.html', {
        'car_list': cars,
        'form': form,
        'queries': queries,
    })
    
def detail(request, office_name, car_id):
    try:
        office = Office.objects.get(name=office_name)
    except Office.DoesNotExist:
        raise Http404
    
    if office.is_active == False:
        return render(request, 'message.html', {'result': 'Офис в данный момент не доступен.'})
    
    try:
        rpc_srv = conn.TimeoutServerProxy(office.xmlrpc, timeout=2)
        car = rpc_srv.get_car(car_id)
        if car == None:
            return render(request, 'message.html', {'result': 'Информация об авто отсутствует.'})
    except Exception, exc:
        office.de_activate()
        return render(request, 'message.html', {'result': 'Офис не ответил.'})
        
    car['office'] = office.name;
    
    from form import OrderForm
    if 'start_date' in request.session.keys() and \
        'end_date' in request.session.keys():
        form = OrderForm(initial = {
            'start_date': request.session['start_date'],
            'end_date': request.session['end_date'],
        })
        
    if request.method == 'POST':
        form = OrderForm(request.POST) 
        if form.is_valid(): 
            start_date=form.cleaned_data['start_date']
            end_date=form.cleaned_data['end_date']
        
            if not request.user.is_authenticated():
                form._errors.setdefault("__all__", ErrorList()).append("Для заказа авторизируйтесь.")
            else:
                try:
                    rpc_srv = conn.TimeoutServerProxy(office.xmlrpc, timeout=2)
                    res = rpc_srv.reserve_car(car_id, start_date.strftime("%Y-%m-%d"), end_date.strftime("%Y-%m-%d"))
                except Exception, exc:
                    return render(request, 'message.html', {'result': 'Офис не ответил.' + str(exc)})

                if res == False:
                    form._errors.setdefault("__all__", ErrorList()).append("Невозможно совершить заказ.")
            
                else:
                    order = Order()
                    order.reserve(car_id, car['name'], start_date, end_date)
                    order.office = office
                    order.order = int(res[0])
                    order.sum = int(res[1])
                    order.user = request.user
                    order.save()
                
                    return HttpResponseRedirect(reverse('account:index'))
        
    return render(request, 'catalog/detail.html', {
        'car': car,
        'form': form,
    })
    
def reserve(request, office_name, car_id):
    pass
