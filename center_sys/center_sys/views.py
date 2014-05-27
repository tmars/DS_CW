import sys
import xmlrpclib

from django.shortcuts import render
from django.http import HttpResponse

def index(request):
    a =12
    b =13
    rpc_srv = xmlrpclib.ServerProxy("http://localhost:1300/xmlrpc/")
    result = rpc_srv.multiply(a, b)
    return HttpResponse('result:' + str(result[0]))