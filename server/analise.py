#############################################
# Data Available at: https://www.kaggle.com/code/matheuslopesvivas/tweet-sentiment-extraction/data
#############################################

from sanic import Sanic, text
import pickle

app = Sanic("PrecictSentiment")

modelo = pickle.load(open('./Model/model.pkl', 'rb'))
vetor = pickle.load(open('./Model/vetor.pkl', 'rb'))

@app.post("/predict")
async def predict(request):
    request.app.config.SENTIMENT_RECEIVED = request.form.get("sentiment")
    predicao = vetor.transform([request.app.config.SENTIMENT_RECEIVED])
    resultado = modelo.predict(predicao)[0]
    if resultado == 0:
        return text("Positive or Neutral Sentiment\n")
    elif resultado == 1:
        return text("Negative Sentiment\n")

########################################################################
# Envio do sentiment deve ser em inglês
# curl localhost:8000/predict -d "sentiment=feeling great" --> Positive
# curl localhost:8000/predict -d "sentiment=feeling down" --> Negative
# curl localhost:8000/predict -d "sentiment=I'm down" --> Positive
########################################################################