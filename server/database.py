import mysql.connector
import os

class Database(object):
    def connect(self):
        banco = mysql.connector.connect(user=os.getenv("DB_USER"), password=os.getenv("DB_PASSWORD"),
                              host='127.0.0.1',
                              database='sentiment')
        return banco

    def close(self, database):
        database.close()