from sanic import Blueprint, json

login = Blueprint("login", url_prefix="/login")


@login.post("/")
async def do_login(request):
    # print(request.form.get("user"))
    # print(request.form.get("password"))
    user = request.form.get("user")
    password = request.form.get("password")
    return json({"user": user, "password": password})


# curl localhost:8000/login -d "user=math&password=pass"