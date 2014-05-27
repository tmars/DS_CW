from django.shortcuts import render
from catalog.models import Car

def multiply(a, b):
    return [c for c in Car.objects.all()]
    return a*b