from functools import wraps

from sanic import Sanic, text

from database import conexao_banco

app = Sanic.get_app("AuthApp")

app.config.USER_RECEIVED = None
app.config.PASSWORD_RECEIVED = None

def check_login(request):
    usuarios = conexao_banco()
    for usuario in usuarios:
        if request.app.config.USER_RECEIVED == usuario[1]:
            if request.app.config.PASSWORD_RECEIVED == usuario[2]:
                return True
        else:
            return False


def protected(wrapped):
    def decorator(f):
        @wraps(f)
        async def decorated_function(request, *args, **kwargs):
            is_authenticated = check_login(request)

            if is_authenticated:
                response = await f(request, *args, **kwargs)
                return response
            else:
                return text("You are unauthorized.", 401)

        return decorated_function

    return decorator(wrapped)
