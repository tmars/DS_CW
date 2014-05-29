from django.contrib import admin

from models import Transaction, Bill

class TransactionAdmin(admin.ModelAdmin):
    fields = ['sender', 'recipient', 'amount', 'create_time']
    list_display = ['sender', 'recipient', 'amount', 'create_time']
    
class BillAdmin(admin.ModelAdmin):
    fields = ['number', 'balance', 'csv']
    list_display = ['number', 'balance']
    
    
admin.site.register(Bill, BillAdmin)
admin.site.register(Transaction, TransactionAdmin)