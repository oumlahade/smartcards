'''
Loads config from environment variables
'''
import os

ENV_DEV = 'development' == os.getenv('FLASK_ENV', 'production')