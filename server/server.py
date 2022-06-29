from sanic import Sanic, text
from dotenv import load_dotenv
from sanic_cors import CORS, cross_origin

from login import login
from signup import signup
import os

app = Sanic("AuthApp")
CORS(app)
app.blueprint(login)
app.blueprint(signup)

from analise import ml

app.blueprint(ml)

@app.get("/secret")
async def secret(request):
    return text("To go fast, you must be fast.")
