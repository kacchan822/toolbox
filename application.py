import json
import re
import os

import bottle

from tools.password import gen_password, gen_crypt_password, check_password_crypted, check_password

## bottle settings
app = application = bottle.Bottle()

## for logging
try:
    import uwsgi
except:
    pass

## my_package
from a2pcej import conv_al, conv_ak


## common functions
def json_response(data, response_code):
    res = bottle.HTTPResponse(status=response_code, body=data)
    # res.set_header('Content-Type', 'application/json; charset=utf-8')
    res.set_header('Content-Type', 'application/vnd.collection+json; charset=utf-8')
    return res


## Routings
@app.route('/')
def home():
    data_dict = {
        'data': [
        {
            'page_name':'Password Generator',
            'page_uri':'/pwgen',
            'page_description':'パスワードを自動生成して、パスワードの暗号化文字列やよみがなを表示します。',
            'page_version':'version:0.1.0 (2016/09/17 release)',
        },
        {
            'page_name':'Crypt Passwords',
            'page_uri':'/cryptpw',
            'page_description':'パスワードの暗号化」・「暗号化されたパスワードと平文パスワードの一致確認」ができます。',
            'page_version':'version:0.1.0 (2016/09/19 release)',
        },
        ]
    }
    return  bottle.template('home', **data_dict)


@app.route('/pwgen')
def pwgen():
    password = gen_password(symbol=False)
    data_dict = {
        'plain_password': password,
        'crypted_password': gen_crypt_password(password),
        'yomigana': conv_ak(password),
        'phonetic_code':conv_al(password),
    }
    return bottle.template('pwgen', page_title='Password Generator', **data_dict)


@app.route('/api/pwgen/pwgen.json', method='POST')
def api_pwgen_json():
    json_d = bottle.request.json
    try:
        uwsgi.set_logvar('postjson', str(json_d))
    except:
        pass
    password_rule = {
        '1':{'alphabet':True, 'uppercase':True, 'number':False, 'symbol':False},
        '2':{'alphabet':True, 'uppercase':False, 'number':False, 'symbol':False},
        '3':{'alphabet':False, 'uppercase':False, 'number':True, 'symbol':False},
        '4':{'alphabet':True, 'uppercase':True, 'number':True, 'symbol':False},
        '5':{'alphabet':True, 'uppercase':False, 'number':True, 'symbol':False},
        '6':{'alphabet':True, 'uppercase':True, 'number':True, 'symbol':True},
        '7':{'alphabet':True, 'uppercase':False, 'number':True, 'symbol':True},
    }

    length = int(json_d['password_length']) if int(json_d['password_length']) < 100 else 100


    password = gen_password(length=length, **password_rule[json_d['password_rule']])

    data_dict = {
        'plain_password': password,
        'crypted_password': gen_crypt_password(password, method=json_d['crypt_method']),
        'yomigana': conv_ak(password, delimiter=json_d['yomigana_delimiter'], sign=json_d['yomigana_sign']),
        'phonetic_code':conv_al(password, delimiter=json_d['phonetic_code_delimiter'], sign=json_d['phonetic_code_sign']),
    }
    return json_response(data_dict, 200)


@app.route('/cryptpw')
def cryptpw():
    return bottle.template('cryptpw', page_title='Crypt Passwords')


@app.route('/api/cryptpw/cryptpw.json', method='POST')
def api_cryptpw_json():
    json_d = bottle.request.json
    try:
        uwsgi.set_logvar('postjson', str(json_d))
    except:
        pass

    method1_reg = re.compile('^(1|MD5-CRYPT|\$1\$)')
    method5_reg = re.compile('^(5|SHA256-CRYPT|\$5\$)')
    method6_reg = re.compile('^(6|SHA512-CRYPT|\$6\$)')

    response_data = []
    for data in json_d:
        plain_password = data['plain_password']
        crypt_method = data['crypt_method']
        crypted_password = data['crypted_password']

        if method1_reg.search(crypt_method) or method1_reg.search(crypted_password):
            filterd_crypt_method = '1'
        elif method5_reg.search(crypt_method) or method5_reg.search(crypted_password):
            filterd_crypt_method = '5'
        elif method6_reg.search(crypt_method) or method6_reg.search(crypted_password):
            filterd_crypt_method = '6'
        else:
            filterd_crypt_method = None

        if crypted_password:
            check_result = check_password(plain_password, crypted_password)
        else:
            if filterd_crypt_method:
                crypted_password = gen_crypt_password(plain_password, method=filterd_crypt_method)
            else:
                crypted_password = gen_crypt_password(plain_password, method='6')
                filterd_crypt_method = '6'
            check_result = True

        response_data.append({
            'plain_password': plain_password,
            'crypt_method': filterd_crypt_method,
            'crypted_password': crypted_password,
            'check': check_result
        })
    return json_response(json.dumps(response_data), 200)


@app.route('/static/<filepath:path>')
def server_static(filepath):
    return bottle.static_file(filepath, root='./static/')


## Run server for development
if __name__ == '__main__':
    app.run(host='127.0.0.1', port=3000, debug=True, reloader=True)

