from time import sleep
from email import parser
from email.mime.image import MIMEImage
from email.mime.text import MIMEText

import smtplib
import poplib
import sys

def sendmail(fr, to, subject, body, host='localhost', port=smtplib.SMTP_PORT):
    msg = MIMEText(body)
    msg['Subject'] = subject
    msg['From'] = fr
    msg['To'] = to
    msg.preamble = subject
    
    s = smtplib.SMTP(host, port)
    s.sendmail(fr, [to], msg.as_string())
    s.quit()
    
class POP3Client():
    
    def __init__(self, username, password, host='localhost', port=poplib.POP3_PORT, timeout=2):
        self.username = username
        self.password = password
        self.host = host
        self.port = port
        self.timeout = timeout
        
    def __resive(self):
        if self.timeout:
            sleep(self.timeout)
            
        pop_conn = poplib.POP3(self.host, self.port)
        pop_conn.user(self.username)
        pop_conn.pass_(self.password)
        #Get messages from server:
        messages = []
        for i in range(1, len(pop_conn.list()[1]) + 1):
            messages.append(pop_conn.retr(i))
            pop_conn.dele(i)
            
        # Concat message pieces:
        messages = ["\n".join(mssg[1]) for mssg in messages]
        #Parse message intom an email object:
        messages = [parser.Parser().parsestr(mssg) for mssg in messages]
        for message in messages:
            self._get(message['from'], message['subject'], message.get_payload())
        pop_conn.quit()

    def start(self):
        print 'Started...'
        try:
            while True:
                self.__resive()
        except KeyboardInterrupt:
            print 'Exit.'
            
    def _get(self, fr, subject, body):
        print 'from:',fr
        print 'subject:',subject
        print 'body:',body
        self.get(fr, subject, body)
        print
       
    def get(self, fr, subject, body):
        pass