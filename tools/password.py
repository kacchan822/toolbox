from crypt import crypt, mksalt, METHOD_MD5, METHOD_SHA256, METHOD_SHA512
from hmac import compare_digest
import random
import re


def gen_password(length=8, alphabet=True, uppercase=True, number=True, symbol=True):
    seeds_dict = {
        'alphabet': ([ chr(i) for i in range(97, 97+26) ], alphabet),
        'uppercase': ([ chr(i) for i in range(65, 65+26) ], uppercase),
        'number': ([ str(i) for i in range(0,10) ], number),
        'symbol': (['=', '@', '#', '?', '$'], symbol),
    }

    seeds = []
    for value in seeds_dict.values():
        if value[1]:
            seeds += value[0]

    while True:
        password = ''.join([ random.choice(seeds) for i in range(0, length) ])
        counter = 0
        check_counter = 0
        for value in seeds_dict.values():
            if value[1]:
                counter += 1
                if len(set(password).intersection(set(value[0]))):
                    check_counter += 1
        if check_counter == counter or counter >= length:
            break
    return password


def gen_crypt_password(password, method='6'):
    method_dict = {'1': METHOD_MD5, '5': METHOD_SHA256, '6': METHOD_SHA512}
    return crypt(password, mksalt(method_dict[method]))


def check_password_crypted(password):
    r = re.compile('^\$(1|5|6)\$[a-zA-Z0-9./]{,16}\$[a-zA-Z0-9./]+')
    if r.search(password):
        return password
    else:
        return gen_crypt_password(password)


def check_password(plainpass, hashpass):
    return compare_digest(crypt(plainpass, hashpass), hashpass)

