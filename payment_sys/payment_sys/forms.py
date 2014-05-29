#coding=utf8

from django import forms

class TransferForm(forms.Form):
    sender = forms.CharField(max_length=8, min_length=8, label='Номер счета')
    csv = forms.CharField(max_length=3, min_length=3, label='Пароль CSV')
    