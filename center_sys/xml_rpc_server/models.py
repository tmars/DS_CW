#coding=utf8

from django.db import models

class Office(models.Model):
    name = models.CharField(max_length=50, verbose_name=u'Название', primary_key=True)
    url = models.URLField(max_length=50, verbose_name=u'URL')
    is_active = models.BooleanField(verbose_name=u'Активный')
    
    @property
    def xmlrpc(self):
        return self.url + 'xmlrpc/'