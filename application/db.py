from flask_mongoengine import MongoEngine


#Inicializa o banco
db = MongoEngine()


def init_db(app):
    db.init_app(app)
