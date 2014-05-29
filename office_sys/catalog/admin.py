#coding=utf8

from django.contrib import admin
from django.conf import settings
from lib.mail import sendmail

from catalog.models import Car, Order

class CarAdmin(admin.ModelAdmin):
    fields = ['brand_type', 'model_name', 'body_type', 'class_type', 'image',
              'tarif1', 'tarif2', 'tarif3', 'tarif4']
    list_display = ['brand_type', 'model_name', 'body_type', 'class_type', 'pub_date']


def make_cancelled(modeladmin, request, queryset):
    for order in queryset:
        order.cancel()
        order.save()
        sendmail(
            settings.EMAIL,
            settings.CENTER_EMAIL,
            'cancel',
            "%d" % (order.id))
make_cancelled.short_description = "Отменить"

def make_closed(modeladmin, request, queryset):
    for order in queryset:
        order.close()
        order.save()
        sendmail(
            settings.EMAIL,
            settings.CENTER_EMAIL,
            'close',
            "%d" % (order.id))

make_closed.short_description = "Закрыть"

    
class OrderAdmin(admin.ModelAdmin):
    fields = ['car', 'sum', 'create_time', 'start_date', 'end_date', 'status']
    list_display = ['car', 'create_time', 'start_date', 'end_date', 'sum', 'status']
    actions = [make_cancelled,make_closed]
    
admin.site.register(Car, CarAdmin)
admin.site.register(Order, OrderAdmin)