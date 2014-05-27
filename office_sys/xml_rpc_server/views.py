from django.shortcuts import render
from catalog.models import Car
import sys
import time

def get_cars(kwargs):
    res = []
    #time.sleep(5)
    for car in Car.objects.filter(**kwargs):
        res.append({
            'id': car.id,
            'name': str(car),
            'tarifs': [car.tarif1, car.tarif2, car.tarif3, car.tarif4],
            'image': 'http://' + 'localhost:' + sys.argv[2] + car.image.url,
        })
    return res