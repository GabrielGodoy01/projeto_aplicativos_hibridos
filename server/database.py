from sanic import Sanic
import mysql.connector
from mysql.connector import Error
import os
from dotenv import load_dotenv

app = Sanic("MySQL")

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
        for r in rows:
            print(r)
except Error as e:
    print(f"Erro ao conectar ao MySQL: {e}")
finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("Connection closed")