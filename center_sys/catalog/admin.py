from django.contrib import admin

from models import Order

class OrderAdmin(admin.ModelAdmin):
    fields = ['office', 'order', 'create_time', 'sum', 'start_date', 'end_date', 'status']
    list_display = ['office', 'create_time', 'order', 'start_date', 'end_date', 'sum', 'status']
    
admin.site.register(Order, OrderAdmin)