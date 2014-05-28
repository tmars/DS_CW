#!/usr/bin/env python
import os
import sys

nodes = {
    'center': {'nd': 'center_sys', 'pt': '1301', 'db': 'rsoi_center_sys'},
    'office1': {'nd': 'office_sys', 'pt': '1302', 'db': 'rsoi_office_sys1'},
    'office2': {'nd': 'office_sys', 'pt': '1303', 'db': 'rsoi_office_sys2'},
}

def get(param, n=None):
    if n == None:
        n = os.environ.get('NODE_IND')
    node = nodes[n]
    if param == "DBNAME":
        return node['db']
    
    elif param == "NAME":
        return n
    
    elif param == "URL":
        return 'http://localhost:%s/' % node['pt']
    
if __name__ == "__main__":
    if sys.argv[1] == 'run':
        for k in nodes:
            node = nodes[k]
            cmd = 'start python %s/manage.py runserver %s %s' % (node['nd'], node['pt'], k)
            os.system(cmd)
            print cmd
            print ('%s: http://localhost:%s/' % (k, node['pt']))
    
    elif sys.argv[1] == 'push_db':
        for k in nodes:
            node = nodes[k]
            os.system('mysqldump %s -u root > db/%s.sql' % (node['db'], node['db']))
            
    elif sys.argv[1] == 'pull_db':
        for k in nodes:
            node = nodes[k]
            os.system('mysql -u root --execute="DROP DATABASE %s"' % (node['db']))
            os.system('mysql -u root --execute="CREATE DATABASE %s"' % (node['db']))
            os.system('mysql -u root -D %s < db/%s.sql' % (node['db'], node['db']))
            
    else:
        print "Error command."