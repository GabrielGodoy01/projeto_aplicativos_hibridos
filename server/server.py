from sanic import Sanic, text
from dotenv import load_dotenv

from login import login
from signup import signup
import os

app = Sanic("AuthApp")
app.blueprint(login)
app.blueprint(signup)

from auth import protected

@app.get("/secret")
@protected
async def secret(request):
    return text("To go fast, you must be fast.")
