from django.contrib import admin

from models import Office

class OfficeAdmin(admin.ModelAdmin):
    fields = ['name', 'url', 'is_active', 'bill', 'email']
    list_display = ['name', 'url', 'is_active', 'bill', 'email']
    
admin.site.register(Office, OfficeAdmin)