import sys
import os
os.sys.path.insert(0,os.path.dirname(os.path.dirname(os.path.abspath(__file__)))) 
from lib.mail import POP3Client

os.environ['NODE_IND']=sys.argv[1]
os.environ['DJANGO_SETTINGS_MODULE']='office_sys.settings'
from django.conf import settings

from catalog.models import Order

class MyClient(POP3Client):
    def get(self, fr, subject, body):
        if subject == 'pay':
            try:
                order_id = int(body)
                order = Order.objects.get(pk=order_id)
                order.pay()
                order.save()
                print 'Payed for order: ', str(order)
            except Exception, exc:
                print 'ERROR: ' + str(exc)
                
        if subject == 'cancel':
            try:
                order_id = int(body)
                order = Order.objects.get(pk=order_id)
                order.cancel()
                order.save()
                print 'Cancelled order: ', str(order)
            except Exception, exc:
                print 'ERROR: ' + str(exc)
    
client = MyClient(settings.EMAIL, settings.PASSWORD)
client.start()