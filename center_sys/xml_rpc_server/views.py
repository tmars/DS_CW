#coding=utf8

from django.shortcuts import render

from models import Office
import lib.conn as conn
from catalog.models import Order

import sys
import time

def register_office(name, url, email, bill):
    try:
        office = Office.objects.get(name=name)
    except:
        office = Office(name=name, url=url, email=email, bill=bill)
    
    if len(Office.objects.filter(is_active=True)) >= 20:
        office.is_active = False
    else:
        office.is_active = True
        
    office.save()
    return office.is_active

def is_active_transaction(transaction_code):
    try:
        order = Order.objects.get(transaction_code=transaction_code)
    except:
        return False
    
    try:
        rpc_srv = conn.TimeoutServerProxy(order.office.xmlrpc, timeout=2)
        res = rpc_srv.is_reserved_order(order.order)
        return res
    except Exception, exc:
        return False