import pyodbc

aulas = []

def anotarClase(bloque, curso, profesor, aula):
    bloque = str(bloque)
    curso = str(curso)
    profesor = str(profesor)
    aula = str(aula)
    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=LAPTOP-7789D1F2\SQLEXPRESS;'
                        'Database=ProhOrt-Mvp;'
                        'Trusted_Connection=yes;')
    
    cursor = conn.cursor()
    
    cursor.execute('UPDATE Bloque SET IdProfesor = ' + profesor + ' WHERE IdBloque = 1')
    
    conn.commit()

anotarClase(1, 0, 1, 0)