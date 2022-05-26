from functools import wraps

from sanic import Sanic, text

from database import conexao_banco

app = Sanic.get_app("AuthApp")

def check_login():
    usuarios = conexao_banco()
    for usuario in usuarios:
        if app.config.USER_RECEIVED == usuario[1]:
            if app.config.PASSWORD_RECEIVED == usuario[2]:
                return True
        else:
            return False


def protected(wrapped):
    def decorator(f):
        @wraps(f)
        async def decorated_function(request, *args, **kwargs):
            is_authenticated = check_login()

            if is_authenticated:
                response = await f(request, *args, **kwargs)
                return response
            else:
                return text("You are unauthorized.", 401)

        return decorated_function

    return decorator(wrapped)
