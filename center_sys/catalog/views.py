#coding=utf8

from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse, Http404

from form import SearchForm
from xml_rpc_server.models import Office
import lib.conn as conn

def index(request):
    kwargs = {}
            
    if request.method == 'POST': 
        form = SearchForm(request.POST) 
        if form.is_valid(): 
            brand=form.cleaned_data['brand']
            class_type=form.cleaned_data['class_type']
            if brand is not None:
                kwargs['brand'] = brand.id
            if class_type != "":
                kwargs['class_type'] = class_type
    else:
        form = SearchForm()
    
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
    
    paginator = Paginator(car_list, 10)
    page = request.GET.get('page')
    try:
        cars = paginator.page(page)
    except PageNotAnInteger:
        cars = paginator.page(1)
    except EmptyPage:
        cars = paginator.page(paginator.num_pages)
        
    return render(request, 'catalog/index.html', {
        'car_list': cars,
        'form': form,
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
        pass
    
    return render(request, 'catalog/detail.html', {'car': car})
    
def reserve(request, office_name, car_id):
    pass
