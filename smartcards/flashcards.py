'''
Holds all flashcard related API call functions
'''
from flask import request, jsonify, abort

from smartcards.application import app
from smartcards.database import flashcardDB as fcdb


@app.route('/flashcardSet.create', methods=['POST'])
def create():
    '''
    Creates a flashcard set
    '''
    req = request.json
    stackName = req['stackname']
    if stackName in fcdb.keys():
        ret = {
            'message': 'stack name already taken'
        }
    else:
        fcdb[stackName] = {}
        ret = {
            'message': 'flashcard set created'
        }
    return jsonify(ret), 200

@app.route('/flashcardSet.deleteStack', methods=['POST'])
def deleteStack():
    '''
    deletes a flashcard set
    '''
    req = request.json
    stackName = req['stackname']
    if stackName in fcdb.keys():
        del fcdb[stackName]
        ret = {
        'message': 'flashcard set deleted'
        }
    else:
        ret = {
            'message': 'Stack could not be deleted'
        }

    return jsonify(ret), 200

@app.route('/flashcard.add', methods=['POST'])
def add():
    '''
    adds a flashcard to a given flashcard set
    '''
    req = request.json
    stackName = req['stackname']
    question = req['question']
    answer = req['answer']
    if stackName in fcdb.keys():
        fcdb[stackName][question] = answer
        ret = {
            'message': 'flashcard added'
        }
    else:
        ret = {
            'message': 'stackname could not be fetched'
        }

    return jsonify(ret), 200

@app.route('/flashcard.delete', methods=['POST'])
def delete():
    '''
    deletes a flashcard given a flashcard set and flashcard term
    '''
    req = request.json
    stackName = req['stackname']
    question = req['question']
    if (stackName in fcdb.keys()):
        if (question in fcdb[stackName].keys()):
            del fcdb[stackName][question]
    ret = {
        'message': 'flashcard deleted'
    }
    print(fcdb)
    return jsonify(ret), 200

@app.route('/flashcardSet.displayStacks', methods=['POST'])
def displayStacks():
    req = request.json
    stackName = req['stackname']
    String = ""
    print(fcData.keys())
    for key in fcData.keys():
        String = String + " " + key


    ret = {
<<<<<<< HEAD
        "messages": String
=======
        "messages": fcdb.keys()
>>>>>>> 2a50f9d84951023cab8da79663291994f69a02b6
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
    question = req['question']
    String = ""
    for x in fcData[stackName]:
        value = fcData[stackName][x]
        key = get_key(value, fcData[stackName])
        String = String + key + ", " + value + "     "


    ret = {
<<<<<<< HEAD
        "messages": String
=======
        "messages": fcdb[stackName][question]
>>>>>>> 2a50f9d84951023cab8da79663291994f69a02b6
    }
    return jsonify(ret), 200