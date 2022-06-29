#############################################
# Data Available at: https://www.kaggle.com/code/matheuslopesvivas/tweet-sentiment-extraction/data
#############################################

from sanic import Blueprint, text
import pickle
from datetime import datetime
from database import feelings


ml = Blueprint("predict", url_prefix="/predict")

modelo = pickle.load(open('./Model/model.pkl', 'rb'))
vetor = pickle.load(open('./Model/vetor.pkl', 'rb'))
now = datetime.now()

@ml.post("/")
async def predict(request):
    sentimento = request.json["feeling"]
    predicao = vetor.transform([sentimento])
    resultado = modelo.predict(predicao)[0]
    if resultado == 0:
        feelings.append({"title" : "Sentimento positivo ou neutro",
        "description" : sentimento,
        "date" : now.strftime("%H:%M %d/%m/%Y")})
        return text("Sentimento positivo ou neutro")
    elif resultado == 1:
        feelings.append({"title" : "Sentimento negativo",
        "description" : sentimento,
        "date" : now.strftime("%H:%M %d/%m/%Y")})
        return text("Sentimento negativo")