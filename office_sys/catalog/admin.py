from django.contrib import admin

from catalog.models import Car, Order

class CarAdmin(admin.ModelAdmin):
    fields = ['brand_type', 'model_name', 'body_type', 'class_type', 'image',
              'tarif1', 'tarif2', 'tarif3', 'tarif4']

class OrderAdmin(admin.ModelAdmin):
    fields = ['car', 'sum', 'start_date', 'end_date', 'status']
    list_display = ['car', 'start_date', 'end_date', 'sum', 'status']
    
admin.site.register(Car, CarAdmin)
admin.site.register(Order, OrderAdmin)