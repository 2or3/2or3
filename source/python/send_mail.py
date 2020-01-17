import sys
from smtplib import SMTP

def send(user, key, from_addr, to_addrs, cc_addrs, msg):
    with SMTP("smtp.sendgrid.net", 587) as smtp:
        smtp.set_debuglevel(True)
        smtp.ehlo()
        smtp.login(user, key)
        smtp.sendmail(from_addr, to_addrs + cc_addrs, msg)
        smtp.quit()

if __name__ == "__main__":
    args = sys.argv
    if len(args) > 2:
        user = args[1]
        key = args[2]
    from_addr = 'test@test.com'
    to_addrs = 'to@test.com'
    cc_addrs = 'cc@test.com'
    msg = 'test massage.'
    send(user, key, from_addr, to_addrs, cc_addrs, msg)
