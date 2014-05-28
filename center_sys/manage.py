#!/usr/bin/env python
import os
import sys

if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "center_sys.settings")
    
    if sys.argv[1] == 'runserver' and len(sys.argv) > 3:
        os.environ.setdefault("NODE_IND", sys.argv.pop(3))
    else:
        os.environ.setdefault("NODE_IND", 'center')
        
    from django.core.management import execute_from_command_line

    execute_from_command_line(sys.argv)
