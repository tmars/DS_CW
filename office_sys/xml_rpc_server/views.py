from django.shortcuts import render

import sys
import time
from datetime import datetime

from catalog.models import Car, Order, get_choice, CLASS_CHOICE
import task

def car_info(car):
    return {
        'id': car.id,
        'name': str(car),
        'tarifs': [car.tarif1, car.tarif2, car.tarif3, car.tarif4],
        'image': task.get("URL")+ car.image.url[1:],
        'class': car.class_name,
        'body': car.body,
    }

def get_cars(kwargs, start_date, end_date):
    start_date = datetime.strptime(start_date, '%Y-%m-%d').date()
    end_date = datetime.strptime(end_date, '%Y-%m-%d').date()
    
    res = []
    #time.sleep(5)
    for car in Car.objects.filter(**kwargs):
        if (car.is_free_for(start_date, end_date)):
            res.append(car_info(car))
    return res
    
def get_car(car_id):
    try:
        return car_info(Car.objects.get(pk=car_id))
    except:
        return None
    
def reserve_car(car_id, start_date, end_date):
    try:
        car = Car.objects.get(pk=car_id)
    except:
        return False
    
    start_date = datetime.strptime(start_date, '%Y-%m-%d').date()
    end_date = datetime.strptime(end_date, '%Y-%m-%d').date()
    
    if not car.is_free_for(start_date, end_date):
        return False
    
    order = Order()
    order.reserve(car=car, start_date=start_date, end_date=end_date)
    order.save()
    return [order.id, order.sum]

def is_reserved_order(order_id):
    try:
        order = Order.objects.get(pk=order_id)
    except :
        return False
    
    if order.status == 'reserve':
        return True
    return False