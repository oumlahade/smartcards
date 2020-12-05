'''
Holds all user related API call functions
'''
from flask import request, jsonify, abort

from smartcards.application import app
from smartcards.database import db


@app.route('/user.signup', methods=['POST'])
def signup():
    req = request.json
    username = req['username']
    password = req['password']
    db[username] = password
    ret = {
        'message': 'user created'
    }
    print(db)
    return jsonify(ret), 200

@app.route('/user.login', methods=['POST'])
def login():
    req = request.json
    loginUsername = req['username']
    loginPassword = req['password']
    if loginUsername in db:
        if loginPassword in db[loginUsername]:
            ret = {
                'message': 'user login successful'
            }
        else:
            ret = {
                'message': 'user login unsuccessful'
            }
    else:
        ret = {
                'message': 'user login unsuccessful'
            }
    print(db)
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
    ret = {
        'message': 'user updated'
    }
    return jsonify(ret), 200