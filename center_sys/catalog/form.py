#coding=utf8

from django import forms
from models import BRAND_CHOICE, CLASS_CHOICE
from datetimewidget.widgets import DateTimeWidget

class SearchForm(forms.Form):
    brand = forms.ChoiceField( (('', '---------'),) + BRAND_CHOICE, required=False, label='Бренд')
    class_type = forms.ChoiceField( (('', '---------'),) + CLASS_CHOICE, required=False, label='Класс')
    start_date = forms.DateTimeField(required=False,label='Начало аренды')
    end_date = forms.DateTimeField(required=False,label='Конец аренды')
    
    class Meta:
        widgets = {
            #Use localization
            'datetime': DateTimeWidget(attrs={'id':"yourdatetimeid"}, usel10n = True)
        }