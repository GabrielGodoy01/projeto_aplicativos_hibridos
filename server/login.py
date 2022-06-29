from sanic import Blueprint, text
from database import existe_no_banco, users

login = Blueprint("login", url_prefix="/login")

@login.post("/")
async def do_login(request):
    user = request.json["user"]
    password = request.json["password"]
    if not existe_no_banco(user, password):
        return text("Usuário não encontrado.\n", 404)
    return text("Login bem sucedido.\n", 200)

