import pyodbc

aula = []

def conVariables(abc):
    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=LAPTOP-7789D1F2\SQLEXPRESS;'
                        'Database=ProhOrt-Mvp;'
                        'Trusted_Connection=yes;')
    
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM ' + abc)
    
    for i in cursor:
        print(i)

conVariables("Aula")