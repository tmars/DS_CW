#coding=utf8

from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib import auth
from django.core.urlresolvers import reverse
from django.forms.util import ErrorList
from django.conf import settings

from form import LoginForm
from catalog.models import Order

def index(request):
    
    if not request.user.is_authenticated():
        return render(request, "message.html", {"result": "Страница для авторизированных пользователей."})
    order_list = Order.objects.filter(user=request.user)
    
    paginator = Paginator(order_list, 8)
    page = request.GET.get('page')
    try:
        orders = paginator.page(page)
    except PageNotAnInteger:
        orders = paginator.page(1)
    except EmptyPage:
        orders = paginator.page(paginator.num_pages)
    
    return render(request, 'account/orders.html', {
        'order_list': orders,
        'paysys_link': settings.PAYSYS_LOC
    })
    
    
def login(request):
    if request.method == 'POST': 
        form = LoginForm(request.POST) 
        if form.is_valid(): 
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']
            user = auth.authenticate(username=username, password=password)
            if user is not None and user.is_active:
                auth.login(request, user)
                return HttpResponseRedirect(reverse('index'))
            else:
                form._errors.setdefault("username", ErrorList())\
                    .append(u"Неверный логин или пароль.")
    else:
        form = LoginForm()
    
    return render(request, 'account/login.html', {
        'form': form,
    })
    
def logout(request):
    auth.logout(request)
    return HttpResponseRedirect(request.META['HTTP_REFERER'])

def success(request):
    if 'order' not in request.GET:
        return HttpResponse("Недостаточно параметров." + str(request.GET.keys()))
    try:
        order = Order.objects.get(pk=request.GET['order'])
    except:
        return HttpResponse("Заказ не найден.")
    
    order.pay()
    order.save()
    
    return HttpResponseRedirect(reverse('account:index'))