#coding=utf8

from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.forms.util import ErrorList

from datetime import datetime

from account.models import Bill, Transaction, Client
from forms import TransferForm
import lib.conn as conn

def transfer(request):
    # проверяем параметры
    if 'transaction' not in request.GET:
        return HttpResponse("Недостаточно параметров." + str(request.GET.keys()))
    try:
        trans = Transaction.objects.get(code=request.GET['transaction'])
    except:
        return HttpResponse("Транзакция не найдена.")

    # проверяем форму
    form = TransferForm()
    if request.method == 'POST':
        form = TransferForm(request.POST)
        
        # форма валидная
        if form.is_valid():
            
            # проверяем счет отправителя
            try:
                sender = Bill.objects.get(number=form.cleaned_data['sender'])
            except Exception, exc:
                form._errors.setdefault("sender", ErrorList()).append("Счет не найден." + str(exc))
                
            if form.cleaned_data['csv'] != sender.csv:
                form._errors.setdefault("csv", ErrorList()).append("Номер csv не верный.")
            
            # счет верный пытаемся осущесвить перевод
            else:
                # спрашиваем нужна ли еще оплата
                try:
                    rpc_srv = conn.TimeoutServerProxy(trans.client.xmlrpc_page, timeout=2)
                    res = rpc_srv.is_active_transaction(trans.code)
                except Exception, exc:
                    return HttpResponse("Ошибка получателя перевода." + str(exc))
                
                if res == False:
                    return HttpResponse("Время перечисления средств истекло.")
                  
                # переводим если достаточно средств  
                if trans.to_pass(sender):
                    return HttpResponseRedirect("%s?transaction=%s" % (trans.client.success_page, trans.code) )
                else:
                    form._errors.setdefault("__all__", ErrorList()).append("Недостаточно средств.")                    
        
    return render(request, "transfer.html", {
        "amount": trans.amount,
        "form": form,
        'queries': request.GET.copy(),
    })
