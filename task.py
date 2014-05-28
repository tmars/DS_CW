#!/usr/bin/env python
import os
import sys

nodes = {
    'center':   {'SYS': 'center_sys', 'PORT': '1301', 'SMTP_PORT': '1401', 'DBNAME': 'rsoi_center_sys'},
    'office1':  {'SYS': 'office_sys', 'PORT': '1302', 'SMTP_PORT': '1402', 'DBNAME': 'rsoi_office_sys1'},
    'office2':  {'SYS': 'office_sys', 'PORT': '1303', 'SMTP_PORT': '1403', 'DBNAME': 'rsoi_office_sys2'},
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
            cmd = 'start python %s/manage.py runserver %s %s' % (get('SYS', k), get('PORT', k), k)
            os.system(cmd)
            print cmd
            """
            cmd = 'start python %s/smtp.py %s %s' % (get('SYS', k), get('SHORT_URL', k), get('SMTP_PORT', k))
            os.system(cmd)
            print cmd"""
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