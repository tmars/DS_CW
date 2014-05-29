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
import lib.conn as conn
from lib.mail import sendmail

def index(request):
    
    if not request.user.is_authenticated():
        return render(request, "message.html", {"result": "Страница для авторизированных пользователей."})
    order_list = Order.objects.filter(user=request.user).order_by('-create_time')
    
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
    })
    
def pay_order(request, order_id):
    
    if not request.user.is_authenticated():
        return render(request, "message.html", {"result": "Страница для авторизированных пользователей."})
    
    try:
        order = Order.objects.get(pk=order_id)    
    except:
        return render(request, "message.html", {"result": "Заказ не найден."})
    
    if order.user.id != request.user.id:
        return render(request, "message.html", {"result": "Ошибка доступа."})
    
    if order.status == 'paid':
        return render(request, "message.html", {"result": "Заказ уже оплачен."})
    
    if order.status == 'cancelled':
        return render(request, "message.html", {"result": "Заказ был отменен."})
    
    try:
        rpc_srv = conn.TimeoutServerProxy(settings.PAYSYS_XMLRPC_PAGE, timeout=2)
        res = rpc_srv.create_transaction(settings.PAYSYS_CLIENT_ID, order.office.bill, order.sum)
    except Exception, exc:
        return render(request, "message.html", {"result": "Платежная система недоступна."})
    
    if res == False:
        return render(request, "message.html", {"result": "Ошибка платежной системы."})
    
    order.transaction_code = res
    order.save()
    return HttpResponseRedirect(settings.PAYSYS_TRANSFER_PAGE + '&transaction=' + res)
    
        
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
    if 'transaction' not in request.GET:
        return HttpResponse("Недостаточно параметров." + str(request.GET.keys()))
    try:
        order = Order.objects.get(transaction_code=request.GET['transaction'])
    except:
        return render(request, "message.html", {"result": "Заказ не найден."})
    
    
    order.pay()
    order.save()

    sendmail(settings.EMAIL, order.office.email, 'pay', str(order.order))
    
    return HttpResponseRedirect(reverse('account:index'))

def cancel_order(request, order_id):
    try:
        order = Order.objects.get(pk=order_id)
    except:
        return render(request, "message.html", {"result": "Заказ не найден."})
    
    order.cancel()
    order.save()

    sendmail(settings.EMAIL, order.office.email, 'cancel', str(order.order))

    return HttpResponseRedirect(reverse('account:index'))
    