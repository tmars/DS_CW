from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from form import SearchForm

from django.http import HttpResponse

import xmlrpclib

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
    
    rpc_srv = xmlrpclib.ServerProxy("http://localhost:1300/xmlrpc/")
    car_list = rpc_srv.get_cars(kwargs)
            
    paginator = Paginator(car_list, 2)
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
    
def detail(request, car_id):
    try:
        car = Car.objects.get(pk=car_id)
    except Car.DoesNotExist:
        raise Http404
    return render(request, 'catalog/detail.html', {'car': car})