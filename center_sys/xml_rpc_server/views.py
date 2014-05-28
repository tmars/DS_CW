from django.shortcuts import render
from models import Office
import sys
import time

def register_office(name, url):
    try:
        office = Office.objects.get(pk=name)
    except:
        office = Office(name=name, url=url)
    
    if len(Office.objects.filter(is_active=True)) >= 20:
        office.is_active = False
    else:
        office.is_active = True
        
    office.save()
    return office.is_active