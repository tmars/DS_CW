#coding=utf8

from django import forms

class LoginForm(forms.Form):
    username = forms.CharField(max_length=50, label='Имя пользователя')
    password = forms.CharField(max_length=50, label='Пароль')
    
    username.widget.attrs['class'] = 'form-control'
    password.widget.attrs['class'] = 'form-control'