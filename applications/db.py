from flask_mongoengine import MongoEngine

db = MongoEngine() #Inicializa o banco

def init_db(app):
    db.init_app(app)
