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