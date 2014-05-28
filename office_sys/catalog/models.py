#coding=utf8

from django.db import models
import os

from lib.models import BODY_CHOICE, CLASS_CHOICE, BRAND_CHOICE, get_choice
    
class Car(models.Model):
    brand_type = models.IntegerField(choices=BRAND_CHOICE, verbose_name=u'Производитель')
    model_name = models.CharField(max_length=100,verbose_name=u'Модель')
    pub_date = models.DateTimeField('date published')
    body_type = models.CharField(max_length=1, choices=BODY_CHOICE, verbose_name=u'Тип кузова')
    class_type = models.CharField(max_length=1, choices=CLASS_CHOICE, verbose_name=u'Класс')
    image = models.ImageField(upload_to="images/cars", verbose_name=u'Изображение')
    
    tarif1 = models.IntegerField(verbose_name=u'тариф на сутки')
    tarif2 = models.IntegerField(verbose_name=u'тариф на период от 3 до 15 суток')
    tarif3 = models.IntegerField(verbose_name=u'тариф на период от 15 до 30 суток')
    tarif4 = models.IntegerField(verbose_name=u'тариф на период свыше 30 суток')
    
    @property
    def brand_name(self):
        return get_choice(self.brand_type, BRAND_CHOICE)
    
    @property
    def class_name(self):
        return get_choice(self.class_type, CLASS_CHOICE)
    
    @property
    def body(self):
        return get_choice(self.body_type, BODY_CHOICE)
    
    def __unicode__(self):
        return "%s %s" % (self.brand_name, self.model_name)