#coding=utf8

from django import forms
from models import Brand, CLASS_CHOICE

class SearchForm(forms.Form):
    brand = forms.ModelChoiceField(Brand.objects.all(), required=False, label='Бренд')
    class_type = forms.ChoiceField( (('', '---------'),) + CLASS_CHOICE, required=False, label='Класс')
    start_date = forms.DateField(required=False,label='Начало аренды')
    end_date = forms.DateField(required=False,label='Конец аренды')