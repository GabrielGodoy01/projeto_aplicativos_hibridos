#############################################
# Data Available at: https://www.kaggle.com/code/matheuslopesvivas/tweet-sentiment-extraction/data
#############################################

from sanic import Sanic, text
import pandas as pd
import os
from dotenv import load_dotenv
from sklearn import preprocessing
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression

ml = Sanic("PrecictSentiment")

load_dotenv()

def predict(dados, coluna_teste, coluna_classificacao):
    vetorizar = CountVectorizer(lowercase=True, max_features=50)
    bag_of_words = vetorizar.fit_transform(dados[coluna_teste])
    
    X_train, X_test, y_train, y_test = train_test_split(bag_of_words, dados[coluna_classificacao], random_state=50)
    
    regressao_logistica = LogisticRegression()
    regressao_logistica.fit(X_train, y_train)
    return regressao_logistica.predict(X_test)

@ml.post("/predict")
async def data(request):
    data = pd.read_csv(os.getenv('PATH_TRAIN'))
    sentiments = data.sentiment.str.split(expand=True).stack().value_counts()

    # Separação dos Sentimentos
    selecao_neutros = data['sentiment'] == 'neutral'
    neutros = data[selecao_neutros]
    negativos = data.query('sentiment == "negative"')
    selecao_positivos = data['sentiment'] == 'positive'
    positivos = data[selecao_positivos]

    # Tratamento de Texto Categórico
    data_ref = data.copy()
    data_ref = data_ref.replace(',', ' ', regex=True)

    ohe = preprocessing.OneHotEncoder(handle_unknown='ignore', sparse=False)
    ohe.fit(data_ref[['sentiment']])

    X = ohe.transform(data_ref[['sentiment']])
    data_numerico = pd.DataFrame(X, columns=ohe.get_feature_names(['sentiment']))
    
    # Deletando a Coluna Texto
    data_ref = data_ref.drop(['sentiment'], axis=1)

    # Concatenando os DataFrames
    data_proc = pd.concat([data_ref, data_numerico], axis=1)

    # Processamento de Texto Semântico
    vec_selected_text = TfidfVectorizer(strip_accents='ascii')
    X_selected_text = vec_selected_text.fit_transform(data_proc['selected_text'].values.astype('str')).todense()
    df_selected_text = pd.DataFrame(X_selected_text, columns=vec_selected_text.get_feature_names())

    # Calculando a Pontuação
    data_proc['text'] = data_proc['text'].astype('str')
    return predict(data_proc, 'text', 'sentiment_negative')