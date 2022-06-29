from sanic import Blueprint, text
from database import existe_no_banco, insercao_banco

signup = Blueprint("signup", url_prefix="/signup")

# Pegar os valores de user e password e adicionar no banco se o usuário já não existir
@signup.post("/")
async def do_signup(request):
    # print(request.form.get("user"))
    # print(request.form.get("password"))
    user = request.form.get("user")
    password = request.form.get("password")
    if not existe_no_banco(user):
        insercao_banco(user, password)
        return text("Usuário criado.\n", 201)
    else:
        return text("Usuário já existe.\n", 409)

# curl localhost:8000/signup -d "user=Matheus&password=senha"