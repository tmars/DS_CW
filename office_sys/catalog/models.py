#coding=utf8

from django.db import models
import os

PROJECT_PATH = os.path.dirname(os.path.abspath(__file__))

BODY_CHOICE = (
    ('u', u'Универсал'),
    ('h', u'Хетчбек'),
    ('s', u'Седан'),
)

CLASS_CHOICE = (
    ('l', u'Эконом класс'),
    ('m', u'Средний класс'),
    ('h', u'Бизнес класс'),
)

class Brand(models.Model):
    brand_name = models.CharField(max_length=50, verbose_name=u'Название бренда')

    def __unicode__(self):
        return self.brand_name
    
class Car(models.Model):
    brand = models.ForeignKey(Brand, blank=False, null=False)
    model_name = models.CharField(max_length=100,verbose_name=u'Модель')
    pub_date = models.DateTimeField('date published')
    body_type = models.CharField(max_length=1, choices=BODY_CHOICE, verbose_name=u'Тип кузова')
    class_type = models.CharField(max_length=1, choices=CLASS_CHOICE, verbose_name=u'Класс')
    image = models.ImageField(upload_to="images/cars", verbose_name=u'Изображение')
    
    tarif1 = models.IntegerField(verbose_name=u'тариф на сутки')
    tarif2 = models.IntegerField(verbose_name=u'тариф на период от 3 до 15 суток')
    tarif3 = models.IntegerField(verbose_name=u'тариф на период от 15 до 30 суток')
    tarif4 = models.IntegerField(verbose_name=u'тариф на период свыше 30 суток')
    
    
    def __unicode__(self):
        return "%s %s" % (self.brand, self.model_name)
            
 
    