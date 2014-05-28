#coding=utf8

from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import auth
from django.core.urlresolvers import reverse
from form import LoginForm

def login(request):
    mes = 'Введите:'
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
                mes = 'Неверный логин или пароль.'
    else:
        form = LoginForm()
    
    return render(request, 'account/login.html', {
        'form': form,
        'message': mes,
    })
    
def logout(request):
    auth.logout(request)
    return HttpResponseRedirect(request.META['HTTP_REFERER'])