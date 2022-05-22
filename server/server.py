from sanic import Sanic, text
from dotenv import load_dotenv

from auth import protected
from login import login
import os

import database

app = Sanic("AuthApp")
app.blueprint(login)

load_dotenv()

app.config.USER_RECEIVED = os.getenv("USER_RECEIVED")
app.config.PASSWORD_RECEIVED = os.getenv("PASSWORD_RECEIVED")

@app.get("/secret")
#@protected
async def secret(request):
    print(app.config.USER_RECEIVED)
    return text("To go fast, you must be fast.")
