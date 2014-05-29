#coding=utf8

from django.db import models
from datetime import datetime
import string
import random

class Bill(models.Model):
    number = models.CharField(max_length=8, verbose_name=u'Номер счета', unique=True)
    balance = models.IntegerField(verbose_name=u'Баланс')
    csv = models.CharField(max_length=3)
    
    def __unicode__(self):
        return self.number

class Client(models.Model):
    name = models.CharField(max_length=50, verbose_name=u'Название')
    xmlrpc_page = models.URLField(max_length=50, verbose_name=u'Ссылка XML RPC')
    success_page = models.URLField(max_length=50, verbose_name=u'Ссылка удачного запроса')
    code = models.CharField(max_length=8, verbose_name=u'Идентификатор', primary_key=True)
    
    def save(self, *args, **kwargs):
        if not self.code:
            self.pk = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(8))
        super(Client, self).save(*args, **kwargs)
    
    def __unicode__(self):
        return "%s (%s)" % (self.name, self.code)
    
class Transaction(models.Model):
    code = models.CharField(max_length=8, verbose_name=u'Идентификатор', primary_key=True)
    sender = models.ForeignKey(Bill, related_name='sender', verbose_name=u'Счет списания', null=True)
    recipient = models.ForeignKey(Bill, related_name='recipient', verbose_name=u'Счет зачисления')
    amount = models.IntegerField(verbose_name=u'Баланс')
    create_time = models.DateTimeField(verbose_name=u'Дата совершения')
    passed_time = models.DateTimeField(verbose_name=u'Дата совершения', null=True)
    is_passed = models.BooleanField(verbose_name=u'Осуществлен')
    client = models.ForeignKey(Client, verbose_name=u'Клиентский сервер')
    
    def create(self, client_id, recipient, amount):
        self.pk = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(8))
        self.create_time = datetime.now()
        self.recipient = recipient
        self.amount = amount
        self.is_passed = False
        self.client_id = client_id
        self.save()
        
    def to_pass(self, sender):
        if sender.balance < self.amount:
            return False
        self.sender = sender
        
        self.sender.balance -= self.amount
        self.recipient.balance += self.amount
        self.passed_time = datetime.now()
        self.is_passed = True
        
        self.recipient.save()
        self.sender.save()
        self.save()
        return True
    
    def __unicode__(self):
        return "%s ($%d)" % (self.code, self.amount)