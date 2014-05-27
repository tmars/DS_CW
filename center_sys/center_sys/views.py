import xmlrpclib
from django.shortcuts import render
from django.http import HttpResponse

def index(request):
    rpc_srv = xmlrpclib.ServerProxy("http://localhost:1300/xmlrpc/")
    car_list = rpc_srv.get_cars(kwargs)
