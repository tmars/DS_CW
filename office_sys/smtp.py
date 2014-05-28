import os
import sys
os.sys.path.insert(0,os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from lib.inbox import Inbox

inbox = Inbox()

@inbox.collate
def handle(to, sender, subject, body):
    print '--------------'
    print to
    print '--------------'
    print sender
    print '--------------'
    print subject
    print '--------------'
    print '\n'.join(body.split('\n')[7:])
    print '--------------'

# Bind directly.
inbox.serve(address=sys.argv[1], port=int(sys.argv[2]))