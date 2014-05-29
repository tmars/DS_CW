#coding=utf8

from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.forms.util import ErrorList

from datetime import datetime

from account.models import Bill, Transaction
from forms import TransferForm

def transfer(request):
    if 'bill' not in request.GET or \
        'order' not in request.GET or \
        'success' not in request.GET or \
        'amount' not in request.GET:
        return HttpResponse("Недостаточно параметров." + str(request.GET.keys()))
    try:
        recipient = Bill.objects.get(number=request.GET['bill'])
    except:
        return HttpResponse("Счет зачисления не найден.")

    try:
        amount = int(request.GET['amount'])
    except:
        return HttpResponse("Неверные параметры.")
    
    
    form = TransferForm()
    if request.method == 'POST':
        form = TransferForm(request.POST)
        if form.is_valid():
            try:
                sender = Bill.objects.get(number=form.cleaned_data['sender'])
                if form.cleaned_data['csv'] != sender.csv:
                    form._errors.setdefault("csv", ErrorList()).append("Номер csv не верный.")
                else:
                    if sender.balance >= amount:
                        trans = Transaction()
                        trans.sender = sender
                        trans.recipient = recipient
                        trans.amount = amount
                        trans.create_time = datetime.now()
                        
                        sender.balance -= amount
                        recipient.balance += amount
                        trans.save()
                        sender.save()
                        recipient.save()
            
                        return HttpResponseRedirect(request.GET['success'] + \
                            "?trans=%d&order=%s" % (trans.id, request.GET['order']) )
            
                    else:
                        form._errors.setdefault("__all__", ErrorList()).append("Недостаточно средств.")                    
                    
            except Exception, exc:
                form._errors.setdefault("sender", ErrorList()).append("Счет не найден." + str(exc))
            
        
    return render(request, "transfer.html", {
        "amount": request.GET['amount'],
        "form": form,
        'queries': request.GET.copy(),
    })
