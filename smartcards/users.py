'''
Holds all user related API call functions
'''
from flask import request, jsonify, abort

from smartcards.application import app
from smartcards.database import userDB as udb
from smartcards.database import flashcardDB as fcdb


@app.route('/user.signup', methods=['POST'])
def signup():
    req = request.json
    username = req['username']
    password = req['password']

    if username in udb:
        message = 'username already taken'
    else:       
        udb[username] = password
        fcdb[username] = {}
        message = 'user created'

    print(f'User created. udb: {udb}')
    ret = {
        'message': message
    }
    return jsonify(ret), 200

@app.route('/user.login', methods=['POST'])
def login():
    req = request.json
    loginUsername = req['username']
    loginPassword = req['password']

    if loginUsername in udb:
        if loginPassword == udb[loginUsername]:
            message = 'user login successful'
            print(f'Username {loginUsername} matches password {loginPassword}. udb: {udb}')
        else:
            message = 'user login unsuccessful'
            print(f'Password {loginPassword} does not match username {loginUsername}. udb: {udb}')
    else:
        message = 'user login unsuccessful'
        print(f'Username {loginUsername} not found. udb: {udb}')

    print(udb)
    ret = {
        'message': message
    }
    return jsonify(ret), 200

@app.route('/user.updateAccount', methods=['POST'])
def update_account():
    req = request.json

    ret = {
        'message': 'user updated'
    }

    return jsonify(ret), 200

@app.route('/user.deleteAccount', methods=['POST'])
def delete_account():
    req = request.json
    username = req['username']
    password = req['password']
    print(udb)
    if username in udb:
        if password in udb[username]:
            del udb[username]
            del fcdb[username]
            ret = {
                'message': 'user deletion successful'
            }
        else:
            ret = {
                'message': 'user deletion unsuccessful'
            }
    else:
        ret = {
            'message': 'user deletion unsuccessful'
        }
    print(udb)
    return jsonify(ret), 200