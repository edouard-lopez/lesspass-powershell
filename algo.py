import hashlib
import binascii

def calc_entropy():
    digest_algorithm = "sha256"
    master_password = 'password'
    salt = 'site'+'login'+hex(1)[2:]
    iterations = 100000
    derived_key_length = 32

    entropy = hashlib.pbkdf2_hmac(digest_algorithm, master_password, salt, iterations, derived_key_length)
    print entropy

if __name__ == '__main__':
    calc_entropy()
