from asyncio.windows_events import NULL
import pyodbc
import fill

class DB:
    def __init__(self, connectionString):
        self.__connectionString = connectionString
        
    def _makeQuery(self, query): # See literalString py 3.11 //sql injections
        with connection as pyodbc.connect(self.__connectionString):
            with cursor as connection:
                cursor.execute(query)
        return cursor
