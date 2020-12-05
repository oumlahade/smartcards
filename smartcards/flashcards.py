'''
Holds all flashcard related API call functions
'''
from flask import request, jsonify, abort

from smartcards.application import app
from smartcards.database import db


@app.route('/flashcardSet.create', methods=['POST'])
def create():
    req = request.json

    ret = {
        'message': 'flashcard set created'
    }

    return jsonify(ret), 200