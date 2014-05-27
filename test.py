import sys
import xmlrpclib
a = 12
b = 14
rpc_srv = xmlrpclib.ServerProxy("http://localhost:1300/xmlrpc/")
result = rpc_srv.multiply(a, b)
print "%d * %d = %d" % (a, b, result)