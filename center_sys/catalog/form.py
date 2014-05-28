#coding=utf8

from django import forms
from django.forms.util import ErrorList
from models import BRAND_CHOICE, CLASS_CHOICE, BODY_CHOICE
from bootstrap3_datetime.widgets import DateTimePicker

class SearchForm(forms.Form):
    brand_type = forms.ChoiceField( (('', '---------'),) + BRAND_CHOICE, required=False, label='Бренд')
    class_type = forms.ChoiceField( (('', '---------'),) + CLASS_CHOICE, required=False, label='Класс')
    body_type = forms.ChoiceField( (('', '---------'),) + BODY_CHOICE, required=False, label='Тип кузова')
    
    start_date = forms.DateField(required=False,label='Начало аренды',
        widget=DateTimePicker(options={"format": "YYYY-MM-DD", "pickTime": False}))
    end_date = forms.DateField(required=False,label='Конец аренды',
        widget=DateTimePicker(options={"format": "YYYY-MM-DD", "pickTime": False}))
   
    brand_type.widget.attrs['class'] = 'form-control'
    class_type.widget.attrs['class'] = 'form-control'
    body_type.widget.attrs['class'] = 'form-control'
    
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
        return flag