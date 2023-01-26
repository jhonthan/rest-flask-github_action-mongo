import os

class DevConfig():

    MONGODB_SETTINGS = {
        'db': os.getenv('MONGODB_DB'),
        'host': os.getenv('MONGODB_HOST'), 
        'username': os.getenv('MONGODB_USER'),
        'password': os.getenv('MONGODB_PASSWORD')
    }

#Teste unitario do banco
class Mockonfig():

    MONGODB_SETTINGS = {
        'db': 'users',
        'host': 'mongomock://localhost'
    }