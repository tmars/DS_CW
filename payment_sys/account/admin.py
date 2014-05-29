from django.contrib import admin

from models import Transaction, Bill, Client

class TransactionAdmin(admin.ModelAdmin):
    fields = ['sender', 'is_passed', 'client', 'amount', 'create_time', 'passed_time']
    list_display = ['sender', 'is_passed', 'client', 'amount', 'create_time', 'passed_time']
    
class BillAdmin(admin.ModelAdmin):
    fields = ['number', 'balance', 'csv']
    list_display = ['number', 'balance']
    
class ClientAdmin(admin.ModelAdmin):
    fields = ['name', 'success_page', 'xmlrpc_page']
    list_display = ['name', 'code']
    
    def get_readonly_fields(self, request, obj=None):
        if obj: # editing an existing object
            return self.readonly_fields + ('code',)
        return self.readonly_fields
    
admin.site.register(Bill, BillAdmin)
admin.site.register(Transaction, TransactionAdmin)
admin.site.register(Client, ClientAdmin)