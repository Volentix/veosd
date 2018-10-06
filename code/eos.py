import subprocess
from cryptography.fernet import Fernet

class Wallet:

    def __init__(self):
        key = Fernet.generate_key()
        self.cipher_suite = Fernet(key)

    def keosd(self):
        subprocess.Popen(["keosd"])

    def create(self):
        out = subprocess.check_output(['cleos', 'wallet', 'create', '-n','stdvtxledger','--to-console'])
        decodedout = out.decode("utf-8")
        parsed = decodedout.split('"')
        f = open("walletpassword.txt", "x")
        enc_text = self.cipher_suite.encrypt(parsed[1].encode())
        f.write(enc_text.decode())
        f.close()

    def open(self):
        out = subprocess.check_output(['cleos', 'wallet', 'open', '-n','stdvtxledger'])

    def lock(self):
        out = subprocess.check_output(['cleos', 'wallet', 'lock', '-n','stdvtxledger'])
    
    def unlock(self):
        f = open("walletpassword.txt", "r")
        pswd = f.read()
        plain_pswd = self.cipher_suite.decrypt(pswd.encode())
        out = subprocess.check_output(['cleos', 'wallet', 'unlock', '-n', 'stdvtxledger', '--password', plain_pswd.decode()])

    def listy(self):
        out = subprocess.check_output(['cleos', 'wallet', 'list'])
        print(out)

