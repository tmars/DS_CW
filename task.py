#!/usr/bin/env python
import os
import sys

nodes = [
    {'nd': 'center_sys', 'pt': '1301', 'db': 'rsoi_center_sys'},
    {'nd': 'office_sys', 'pt': '1302', 'db': 'rsoi_office_sys1'}
]

if __name__ == "__main__":
    if sys.argv[1] == 'run':
        for node in nodes:
            os.system('start python %s/manage.py runserver %s %s' % (node['nd'], node['pt'], node['db']))
            print ('start python %s/manage.py runserver %s %s' % (node['nd'], node['pt'], node['db']))
    
    elif sys.argv[1] == 'push_db':
        for node in nodes:
            os.system('mysqldump %s -u root > db/%s.sql' % (node['db'], node['db']))
            
    elif sys.argv[1] == 'pull_db':
        for node in nodes:
            os.system('mysql -u root --execute="DROP DATABASE %s"' % (node['db']))
            os.system('mysql -u root --execute="CREATE DATABASE %s"' % (node['db']))
            os.system('mysql -u root -D %s < db/%s.sql' % (node['db'], node['db']))
            
    