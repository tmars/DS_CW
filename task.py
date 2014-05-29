#!/usr/bin/env python
import os
import sys

nodes = {
    'center':   {'SYS': 'center_sys', 'PORT': '1301', 'DBNAME': 'rsoi_center_sys',
        'EMAIL': 'center@rsoi.ru'},
        
    'office1':  {'SYS': 'office_sys', 'PORT': '1302', 'DBNAME': 'rsoi_office_sys1',
        'EMAIL': 'office1@rsoi.ru', 'PASS': '1234', 'WITH_POP3': '1', 'BILL': '12345678'},
        
    'office2':  {'SYS': 'office_sys', 'PORT': '1303', 'DBNAME': 'rsoi_office_sys2',
        'EMAIL': 'office2@rsoi.ru', 'PASS': '1234', 'WITH_POP3': '1', 'BILL': '87654321'},
        
    'payment':  {'SYS': 'payment_sys', 'PORT': '1304', 'DBNAME': 'rsoi_payment_sys'},
}

def get(param, n=None):
    if n == None:
        n = os.environ.get('NODE_IND')
    node = nodes[n]
    if param == "NAME":
        return n
    
    elif param == "URL":
        return 'http://localhost:%s/' % node['PORT']
        
    elif param == "SHORT_URL":
        return 'localhost'
        
    elif param in node.keys():
        return node[param]
    
    
if __name__ == "__main__":
    if sys.argv[1] == 'run':
        if len(sys.argv) > 2:
            ns = sys.argv[2:]
        else:
            ns = nodes
        for k in ns:
            cmd = 'start "%s server" /MIN python %s/manage.py runserver %s %s' % (k, get('SYS', k), get('PORT', k), k)
            os.system(cmd)
            print cmd
            
            if get('WITH_POP3', k):
                cmd = 'start "%s pop3" /MIN python %s/client.py %s' % (k, get('SYS', k), k)
                os.system(cmd)
                print cmd
                
            print ('%s: http://localhost:%s/' % (k, get('PORT', k)))
            print
    
    elif sys.argv[1] == 'push_db':
        for k in nodes:
            os.system('mysqldump %s -u root > db/%s.sql' % (get('DBNAME', k), get('DBNAME', k)))
            
    elif sys.argv[1] == 'pull_db':
        for k in nodes:
            os.system('mysql -u root --execute="DROP DATABASE %s"' % (get('DBNAME', k)))
            os.system('mysql -u root --execute="CREATE DATABASE %s"' % (get('DBNAME', k)))
            os.system('mysql -u root -D %s < db/%s.sql' % (get('DBNAME', k), get('DBNAME', k)))
            
    else:
        print "Error command."