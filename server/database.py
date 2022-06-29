from sanic import Sanic
import mysql.connector
from mysql.connector import Error
import os
from dotenv import load_dotenv

app = Sanic("MySQL")

##########################################
# Criar um DATABASE chamado sentiment e 
# uma TABELA chamada users no mysql
#
# Dentro de users, colocar duas colunas:
# name e password
##########################################

def conexao_banco():
    load_dotenv()

    try:
        connection = mysql.connector.connect(host='localhost',
                                                database='sentiment',
                                                user=os.getenv('DB_USER'),
                                                password=os.getenv('DB_PASSWORD'))
        if connection.is_connected():
            cursor = connection.cursor(buffered=True)
            cursor.execute("select * from users;")
            rows = cursor.fetchall()
            return rows
            # for r in rows:
            #     print(r)
    except Error as e:
        print(f"Erro ao conectar ao MySQL: {e}")
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            #print("Connection closed")

def insercao_banco(user, password):
    load_dotenv()

    try:
        connection = mysql.connector.connect(host='localhost',
                                                database='sentiment',
                                                user=os.getenv('DB_USER'),
                                                password=os.getenv('DB_PASSWORD'))
        cursor = connection.cursor(buffered=True)
        cursor.execute("INSERT INTO users (name, password) VALUES (%s, %s);", (user, password))
        connection.commit()
    except Error as e:
        print(f"Erro ao inserir no Banco: {e}")
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            #print("Connection closed")

def existe_no_banco(user):
    usuarios = conexao_banco()
    for usuario in usuarios:
        if user == usuario[1]:
            return True
        else:
            return False