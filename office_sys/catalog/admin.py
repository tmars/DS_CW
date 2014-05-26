from django.contrib import admin

from django.contrib import admin
from catalog.models import *

class CarAdmin(admin.ModelAdmin):
    fields = ['brand', 'model_name', 'body_type', 'class_type', 'image',
              'tarif1', 'tarif2', 'tarif3', 'tarif4']

admin.site.register(Car, CarAdmin)
admin.site.register(Brand)