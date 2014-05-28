#coding=utf8

from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import auth
from django.core.urlresolvers import reverse
from django.forms.util import ErrorList
from form import LoginForm

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