from sanic import Sanic, text

from auth import protected
from login import login

app = Sanic("AuthApp")
app.config.USER = "math"
app.config.PASSWORD = "pass"
app.blueprint(login)


@app.get("/secret")
@protected
async def secret(request):
    return text("To go fast, you must be fast.")
