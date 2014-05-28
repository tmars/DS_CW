from django.contrib import admin

from models import Order

class OrderAdmin(admin.ModelAdmin):
    fields = ['office', 'order', 'sum', 'start_date', 'end_date', 'status']
    list_display = ['office', 'order', 'start_date', 'end_date', 'sum', 'status']
    
admin.site.register(Order, OrderAdmin)