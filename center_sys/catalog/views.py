#coding=utf8

from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse, Http404
from django.forms.util import ErrorList

from xml_rpc_server.models import Office
import lib.conn as conn

def index(request):
    kwargs = {}
    
    from form import SearchForm
    form = SearchForm(request.GET)
    if form.is_valid(): 
        brand_type=form.cleaned_data['brand_type']
        class_type=form.cleaned_data['class_type']
        if brand_type != "":
            kwargs['brand_type'] = brand_type
        if class_type != "":
            kwargs['class_type'] = class_type
    
    car_list = []
    for office in Office.objects.filter(is_active=True):
        try:
            rpc_srv = conn.TimeoutServerProxy(office.xmlrpc, timeout=2)
            for car in rpc_srv.get_cars(kwargs):
                car['office'] = office.name;
                car_list.append(car)
              
        except:
            office.de_activate()
            pass
    
    paginator = Paginator(car_list, 8)
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
        office = Office.objects.get(pk=office_name)
    except Office.DoesNotExist:
        raise Http404
    
    if office.is_active == False:
        return render(request, 'message.html', {'result': 'Офис в данный момент не доступен.'})
    
    try:
        rpc_srv = conn.TimeoutServerProxy(office.xmlrpc, timeout=2)
        car = rpc_srv.get_car(car_id)
        if car == None:
            return render(request, 'message.html', {'result': 'Информация об авто отсутствует.'})
    except:
        office.de_activate()
        return render(request, 'message.html', {'result': 'Сервер не ответил за указанное время.'})
        
    car['office'] = office.name;
    
    from form import OrderForm
    if request.method == 'POST': 
        form = OrderForm(request.POST) 
        if form.is_valid(): 
            start_date=form.cleaned_data['start_date']
            end_date=form.cleaned_data['end_date']
            form._errors.setdefault("username", ErrorList())\
                .append(u"Неверный логин или пароль.")
    else:
        form = OrderForm()
    
    return render(request, 'catalog/detail.html', {
        'car': car,
        'form': form,
    })
    
def reserve(request, office_name, car_id):
    pass
