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
    email = req['email']
    db[username] = password
    ret = {
        'message': 'user created'
    }

    return jsonify(ret), 200

@app.route('/user.login', methods=['POST'])
def login():
    req = request.json

    email = req['email']
    password = req['password']
    
    ret = {
        'message': 'user logged in'
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

    user_id = req['user_id']

    ret = {
        'message': 'user deleted'
    }

    return jsonify(ret), 200