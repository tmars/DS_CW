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
inbox.serve(address='localhost', port=4467)