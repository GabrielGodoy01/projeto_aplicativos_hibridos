from sanic import Sanic
import os

feelings = [{
    "title" : "Qualquer",
    "description" : "Qualquer",
    "date" : "19/08/2021"
}]
users = [{
    "user" : "123",
    "password" : "123"
}]


def inserir_feeling(feeling):
    feelings.append(feeling)

def inserir_usuário(user, password):
    users.append({"user" : user, "password" : password})

def existe_no_banco(user, password):
    for json in users:
        if json["user"] == user and json["password"] == password:
            return True
    return False