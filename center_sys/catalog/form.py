#coding=utf8

from django import forms
from django.forms.util import ErrorList
from bootstrap3_datetime.widgets import DateTimePicker

from datetime import date

from models import BRAND_CHOICE, CLASS_CHOICE, BODY_CHOICE
from xml_rpc_server.models import Office

class SearchForm(forms.Form):
    brand_type = forms.ChoiceField( (('', '---------'),) + BRAND_CHOICE, required=False, label='Бренд')
    class_type = forms.ChoiceField( (('', '---------'),) + CLASS_CHOICE, required=False, label='Класс')
    body_type = forms.ChoiceField( (('', '---------'),) + BODY_CHOICE, required=False, label='Тип кузова')
    
    start_date = forms.DateField(label='Начало аренды',
        widget=DateTimePicker(options={"format": "YYYY-MM-DD", "pickTime": False}))
    end_date = forms.DateField(label='Конец аренды',
        widget=DateTimePicker(options={"format": "YYYY-MM-DD", "pickTime": False}))
   
    offices = forms.ModelMultipleChoiceField(Office.objects.filter(is_active=True),required=False,label='Отделения')
    
    brand_type.widget.attrs['class'] = 'form-control'
    class_type.widget.attrs['class'] = 'form-control'
    body_type.widget.attrs['class'] = 'form-control'
    offices.widget.attrs['class'] = 'form-control'
    
class OrderForm(forms.Form):
    start_date = forms.DateField(label='Начало аренды',
        widget=DateTimePicker(options={"format": "YYYY-MM-DD", "pickTime": False}))
    end_date = forms.DateField(label='Конец аренды',
        widget=DateTimePicker(options={"format": "YYYY-MM-DD", "pickTime": False}))
        
    def is_valid(self):
        flag = super(OrderForm, self).is_valid()
        if flag and self.cleaned_data['start_date'] >= self.cleaned_data['end_date']:
            errors = self._errors.setdefault("start_date", ErrorList())
            errors.append(u"Неправильный период бронирования.")
            flag = False
        if flag and self.cleaned_data['start_date'] < date.today():
            errors = self._errors.setdefault("start_date", ErrorList())
            errors.append(u"Нельзя заказать задним числом.")
            flag = False
        return flag