from sanic import Blueprint, text
from database import existe_no_banco, inserir_usuário

signup = Blueprint("signup", url_prefix="/signup")

@signup.post("/")
async def do_signup(request):
    user = request.json["user"]
    password = request.json["password"]
    if not existe_no_banco(user, password):
        inserir_usuário(user, password)
        return text("Usuário criado.\n", 201)
    else:
        return text("Usuário já existe.\n", 409)
