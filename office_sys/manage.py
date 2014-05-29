#!/usr/bin/env python
import os
import sys

os.sys.path.insert(0,os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import task
import lib.conn as conn

if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "office_sys.settings")

    flag = False
    if sys.argv[1] == 'runserver' and len(sys.argv) > 3:
        os.environ.setdefault("NODE_IND", sys.argv.pop(3))
        try:
            rpc_srv = conn.TimeoutServerProxy(task.get("URL", 'center') + 'xmlrpc/', timeout=2)
            flag = rpc_srv.register_office(task.get("NAME"), task.get("URL"), task.get("EMAIL"), task.get('BILL'))
            
        except Exception, exp:
            print "Error connection with center: " + str(exp)

    else:
        os.environ.setdefault("NODE_IND", "office1")
        flag = True
        
    if flag:
        from django.core.management import execute_from_command_line
        
        execute_from_command_line(sys.argv)
        
        

        