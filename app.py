
from flask import Flask
from flask_restful import Resource, Api
from flask_mongoengine import MongoEngine

app = Flask(__name__)

app.config['MONGODB_SETTINGS'] = {
    'db': 'users',
    'port': '27017',
    'host': 'mongodb',    
    'username': 'admin',
    'password': 'admin'
}

api = Api(app) #Inicializa API
db = MongoEngine(app) #Inicializa o banco

#Declaracao da classe conectando ao Banco - MongoDB - NoSQL
class UserModel(db.Document):
    cpf = db.StringField(required=True, unique=True)
    first_name = db.StringField(required=True)
    last_name = db.StringField(required=True)
    email = db.EmailField(required=True)
    birth_date = db.DateTimeField(required=True)   

class Users(Resource):
    def get(self):
        #return jsonify(UserModel.objects())
        return {"message": "user 1"}

class User(Resource):
    def post(self):
        return {"message": "teste"}

    def get(self, cpf):
        return {"message": "CPF"}

#Endpoints
api.add_resource(Users, '/users')
api.add_resource(User, '/user', '/user/<string:cpf>')

if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0")
