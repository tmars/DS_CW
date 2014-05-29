import sys
import os
os.sys.path.insert(0,os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from lib.mail import POP3Client

os.environ['NODE_IND']=sys.argv[1]
os.environ['DJANGO_SETTINGS_MODULE']='center_sys.center_sys.settings'
from django.conf import settings

from catalog.models import Order
from xml_rpc_server.models import Office

class MyClient(POP3Client):
    def get(self, fr, subject, body):
        if subject == 'cancel':
            try:
                office = Office.objects.get(email=fr)
                order_id = int(body)
                order = Order.objects.get(office=office,order=order_id)
                order.cancel()
                order.save()
                print 'Cancelled order: ', str(order)
            except Exception, exc:
                print 'ERROR: ' + str(exc)
                
        elif subject == 'close':
            try:
                office = Office.objects.get(email=fr)
                order_id = int(body)
                order = Order.objects.get(office=office,order=order_id)
                order.close()
                order.save()
                print 'Closed order: ', str(order)
            except Exception, exc:
                print 'ERROR: ' + str(exc)
    
client = MyClient(settings.EMAIL, settings.PASSWORD)
client.start()