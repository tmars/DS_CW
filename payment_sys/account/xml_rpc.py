from models import Bill, Transaction

def create_transaction(client_id, recipient_number, amount):
    try:
        recipient = Bill.objects.get(number=recipient_number)
    except:
        return [recipient_number, amount]
    trans = Transaction()
    trans.create(client_id, recipient, amount)
    
    return trans.code