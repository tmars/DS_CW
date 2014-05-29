# Import smtplib for the actual sending function
from lib.mail import sendmail
    
sendmail('mbox141-02@dev.iu7.bmstu.ru', 'office1@rsoi.ru', 'pay', '29')