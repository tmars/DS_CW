from django.shortcuts import render
from catalog.models import Car, get_choice, CLASS_CHOICE
import sys
import time
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

def get_cars(kwargs):
    res = []
    #time.sleep(5)
    for car in Car.objects.filter(**kwargs):
        res.append(car_info(car))
    return res
    
def get_car(car_id):
    try:
        return car_info(Car.objects.get(pk=car_id))
    except:
        return None