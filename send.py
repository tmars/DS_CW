# Import smtplib for the actual sending function
import smtplib

# Here are the email package modules we'll need
from email.mime.image import MIMEImage
from email.mime.text import MIMEText

COMMASPACE = ', '

# Create the container (outer) email message.
msg = MIMEText('message')
msg['Subject'] = 'Our family reunion'
me = 'i@m.ru'
family = ['1@m.ru']
msg['From'] = me
msg['To'] = COMMASPACE.join(family)
msg.preamble = 'Our family reunion'



# Send the email via our own SMTP server.
s = smtplib.SMTP('localhost:4467')
s.sendmail(me, family, msg.as_string())
s.quit()