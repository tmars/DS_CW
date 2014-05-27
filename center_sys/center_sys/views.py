import sys
import xmlrpclib

from django.shortcuts import render
from django.http import HttpResponse

def index(request):
    a =12
    b =13
    rpc_srv = xmlrpclib.ServerProxy("http://localhost:1300/api/")
    result = rpc_srv.multiply(a, b)
    print "%d * %d = %d" % (a, b, result)
    return HttpResponse('result:' + str(result))