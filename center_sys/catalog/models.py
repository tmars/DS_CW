#coding=utf8

from django.db import models
import os
from datetime import datetime

from lib.models import STATUS_CHOICE, BODY_CHOICE, BRAND_CHOICE, CLASS_CHOICE, get_choice
from xml_rpc_server.models import Office
from django.contrib.auth.models import User

class Order(models.Model):
    user = models.ForeignKey(User, verbose_name=u'Клиент')
    office = models.ForeignKey(Office, verbose_name=u'Офис заказа')
    order = models.IntegerField(verbose_name=u'Номер заказа')
    car = models.IntegerField(verbose_name=u'Номер машины')
    car_name = models.CharField(max_length=255,verbose_name=u'Название авто')
    sum = models.IntegerField(verbose_name=u'Сумма заказа')
    start_date = models.DateField(verbose_name=u'Начало периода')
    end_date = models.DateField(verbose_name=u'Конец периода')
    create_time = models.DateTimeField(verbose_name=u'Дата создания')
    transaction_code = models.CharField(max_length=8, verbose_name=u'Идентификатор транзакции', null=True)
    status = models.CharField(max_length=10, choices=STATUS_CHOICE, verbose_name=u'Статус')
    
    def save(self, *args, **kwargs):
        if not self.pk:
            self.create_time = datetime.now()
        super(Order, self).save(*args, **kwargs)
        
    def reserve(self, car, car_name, start_date, end_date):
        self.status = 'reserve'
        self.car = car
        self.car_name = car_name
        self.start_date = start_date
        self.end_date = end_date
                
    def pay(self):
        self.status = 'paid'
        
    def cancel(self):
        self.status = 'cancelled'
        
    def __unicode__(self):
        return "%s (%s)" % (str(self.office), self.order)
    
    @property
    def status_name(self):
        return get_choice(self.status, STATUS_CHOICE)