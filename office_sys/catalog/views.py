from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from models import Car, Brand
from form import SearchForm

def index(request):
    car_list = Car.objects.all()
    
    if request.method == 'POST': 
        form = SearchForm(request.POST) 
        if form.is_valid(): 
            brand=form.cleaned_data['brand']
            class_type=form.cleaned_data['class_type']
            kwargs = {}
            if brand is not None:
                kwargs['brand'] = brand
            if class_type != "":
                kwargs['class_type'] = class_type
                
            car_list = Car.objects.filter(**kwargs)
    else:
        form = SearchForm()
    
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