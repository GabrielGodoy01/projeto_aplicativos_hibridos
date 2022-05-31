from sanic import Blueprint, text

login = Blueprint("login", url_prefix="/login")

# Pegar os valores de user e password e comparar com o que está no banco
@login.post("/")
async def do_login(request):
    # print(request.form.get("user"))
    # print(request.form.get("password"))
    request.app.config.USER_RECEIVED = request.form.get("user")
    request.app.config.PASSWORD_RECEIVED = request.form.get("password")
    return text("Login bem sucedido", 200)

# curl localhost:8000/login -d "user=Matheus&password=senha"