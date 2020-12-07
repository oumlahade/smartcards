'''
Holds all flashcard related API call functions
'''
from flask import request, jsonify, abort

from smartcards.application import app
from smartcards.database import flashcardDB as fcdb


@app.route('/flashcardSet.create', methods=['POST'])
def createStack():
    '''
    Creates a flashcard set
    '''
    req = request.json
    stackName = req['stackname']
    username = req['username']

    if stackName in fcdb[username].keys():
        message = 'stack name already taken'
    else:
        fcdb[username][stackName] = {}
        message = 'flashcard set created'

    ret = {
        'message': message
    }
    return jsonify(ret), 200

@app.route('/flashcardSet.deleteStack', methods=['POST'])
def deleteStack():
    '''
    deletes a flashcard set
    '''
    req = request.json
    stackName = req['stackname']
    username = req['username']

    if stackName in fcdb[username].keys():
        del fcdb[username][stackName]
        message = 'flashcard set deleted'
    else:
        message = 'stack could not be deleted'

    ret = {
        'message': message
    }
    return jsonify(ret), 200

@app.route('/flashcard.add', methods=['POST'])
def add():
    '''
    adds a flashcard to a given flashcard set
    '''
    req = request.json
    stackName = req['stackname']
    username = req['username']
    question = req['question']
    answer = req['answer']

    if stackName in fcdb[username].keys():
        fcdb[username][stackName][question] = answer
        message = 'flashcard added'
    else:
        message = 'stackname could not be fetched'

    ret = {
        'message': message
    }
    return jsonify(ret), 200

@app.route('/flashcard.delete', methods=['POST'])
def delete():
    '''
    deletes a flashcard given a flashcard set and flashcard term
    '''
    req = request.json
    stackName = req['stackname']
    username = req['username']
    question = req['question']

    if (stackName in fcdb[username].keys()):
        if (question in fcdb[username][stackName].keys()):
            del fcdb[username][stackName][question]

    ret = {
        'message': 'flashcard deleted'
    }
    print(fcdb[username])
    return jsonify(ret), 200

@app.route('/flashcardSet.displayStacks', methods=['POST'])
def displayStacks():
    req = request.json
    stackName = req['stackname']
    username = req['username']

    string = ""
    print(fcdb[username].keys())
    for key in fcdb[username].keys():
        string = string + " " + key

    ret = {
        "messages": string
    }
    return jsonify(ret), 200

def get_key(val, my_dict): 
    for key, value in my_dict.items(): 
         if val == value: 
             return key 

@app.route('/flashcardSet.displayCards', methods=['POST'])
def displayCards():
    '''
    returns the definition on a flashcard
    '''
    req = request.json
    stackName = req['stackname']
    username = req['username']
    question = req['question']

    string = ""
    for x in fcdb[username][stackName]:
        value = fcdb[username][stackName][x]
        key = get_key(value, fcdb[username][stackName])
        string = string + key + ", " + value + "     "

    ret = {
        "messages": string
    }
    return jsonify(ret), 200