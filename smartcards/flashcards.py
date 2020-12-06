'''
Holds all flashcard related API call functions
'''
from flask import request, jsonify, abort

from smartcards.application import app
from smartcards.database import db
from smartcards.user_database import fcData


@app.route('/flashcardSet.create', methods=['POST'])
def create():
    req = request.json
    stackName = req['stackname']
    if stackName in fcData.keys():
        ret = {
            'message': 'stack name already taken'
        }
    else:
        fcData[stackName] = {}
        ret = {
            'message': 'flashcard set created'
        }
    return jsonify(ret), 200

@app.route('/flashcardSet.deleteStack', methods=['POST'])
def deleteStack():
    req = request.json
    stackName = req['stackname']
    if stackName in fcData.keys():
        del fcData[stackName]
        ret = {
        'message': 'flashcard set deleted'
        }
    else:
        ret = {
            'message': 'Stack could not be deleted'
        }

    return jsonify(ret), 200

@app.route('/flashcardSet.add', methods=['POST'])
def add():
    req = request.json
    stackName = req['stackname']
    question = req['question']
    answer = req['answer']
    if stackName in fcData.keys():
        fcData[stackName][question] = answer
        ret = {
            'message': 'flashcard added'
        }
    else:
        ret = {
            'message': 'stackname could not be fetched'
        }

    return jsonify(ret), 200

@app.route('/flashcardSet.delete', methods=['POST'])
def delete():
    req = request.json
    stackName = req['stackname']
    question = req['question']
    if (stackName in fcData.keys()):
        if (question in fcData[stackName].keys()):
            del fcData[stackName][question]
    ret = {
        'message': 'flashcard set created'
    }
    print(fcData)
    return jsonify(ret), 200

@app.route('/flashcardSet.displayStacks', methods=['POST'])
def displayStacks():
    req = request.json
    stackName = req['stackname']
    ret = {
        "messages": fcData.keys()
    }
    return jsonify(ret), 200

@app.route('/flashcardSet.displayCards', methods=['POST'])
def displayCards():
    req = request.json
    stackName = req['stackname']
    question = req['question']
    ret = {
        "messages": fcData[stackName][question]
    }
    return jsonify(ret), 200