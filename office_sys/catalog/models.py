#coding=utf8

from django.db import models
import os

from lib.models import BODY_CHOICE, CLASS_CHOICE, BRAND_CHOICE, STATUS_CHOICE, get_choice
    
class Car(models.Model):
    brand_type = models.IntegerField(choices=BRAND_CHOICE, verbose_name=u'Производитель')
    model_name = models.CharField(max_length=100,verbose_name=u'Модель')
    pub_date = models.DateTimeField('date published')
    body_type = models.CharField(max_length=1, choices=BODY_CHOICE, verbose_name=u'Тип кузова')
    class_type = models.CharField(max_length=1, choices=CLASS_CHOICE, verbose_name=u'Класс')
    image = models.ImageField(upload_to="images/cars", verbose_name=u'Изображение')
    
    tarif1 = models.IntegerField(verbose_name=u'тариф на сутки')
    tarif2 = models.IntegerField(verbose_name=u'тариф от 3 до 15 суток')
    tarif3 = models.IntegerField(verbose_name=u'тариф от 15 до 30 суток')
    tarif4 = models.IntegerField(verbose_name=u'тариф от 30 суток')
    
    @property
    def brand_name(self):
        return get_choice(self.brand_type, BRAND_CHOICE)
    
    @property
    def class_name(self):
        return get_choice(self.class_type, CLASS_CHOICE)
    
    @property
    def body(self):
        return get_choice(self.body_type, BODY_CHOICE)
    
    def is_free_for(self, start_date, end_date):
        min_date = min(start_date, end_date)
        max_date = max(start_date, end_date)
    
        requests = Order.objects.filter(car=self.id)
        for r in requests:
            if max_date < r.start_date or min_date > r.end_date:
                continue
            else:
                return False
        return True
    
    def __unicode__(self):
        return "%s %s" % (self.brand_name, self.model_name)
    
class Order(models.Model):
    car = models.ForeignKey(Car, verbose_name=u'тариф на сутки')
    sum = models.IntegerField(verbose_name=u'Сумма заказа')
    start_date = models.DateField(verbose_name=u'Начало периода')
    end_date = models.DateField(verbose_name=u'Конец периода')
    status = models.CharField(max_length=10, choices=STATUS_CHOICE, verbose_name=u'Статус')
    
    def reserve(self, car, start_date, end_date):
        self.start_date = start_date
        self.end_date = end_date
        self.car = car
        self.status = 'reserve'
        
        delta = self.end_date - self.start_date
        price = car.tarif1
        if delta.days > 3:
            price = car.tarif2
        if delta.days > 15:
            price = car.tarif3
        if delta.days > 30:
            price = car.tarif4
            
        self.sum = price * delta.days
        
    def pay(self):
        self.status = 'paid'
        
    def cancel(self):
        self.status = 'cancelled'
        
    def __unicode__(self):
        return "%s [%d]" % (str(self.car), self.car.id)