#coding=utf8

from django.db import models
from datetime import datetime

class Bill(models.Model):
    number = models.CharField(max_length=8, verbose_name=u'Номер счета', unique=True)
    balance = models.IntegerField(verbose_name=u'Баланс')
    csv = models.CharField(max_length=3)
    
    def __unicode__(self):
        return self.number
    
class Transaction(models.Model):
    sender = models.ForeignKey(Bill, related_name='sender', verbose_name=u'Счет списания')
    recipient = models.ForeignKey(Bill, related_name='recipient', verbose_name=u'Счет зачисления')
    amount = models.IntegerField(verbose_name=u'Баланс')
    create_time = models.DateTimeField(verbose_name=u'Дата совершения')
    
    def __unicode__(self):
        return "%d -> %d (%d)" % (self.sender.id, self.recipient.id, self.amount)
