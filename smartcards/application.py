'''
Initialize Flask app and set debug mode
Import smartcards api modules for proper routing
'''
from flask import Flask

from smartcards import config


app = Flask(__name__)
app.debug = config.ENV_DEV

# Import all files for proper routing here
'''
Like this:
import smartcards.testing
import smartcards.users
import smartcards.listings
'''