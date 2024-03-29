import pyodbc

cursos = []
profesores = []
aulas = []
bloques = []
resultados = []
anios = []
orientaciones = []
materias = []
profesorxMaterias = []

def conection():
    pyodbc.connect('Driver={SQL Server};'
                        'Server=LAPTOP-7789D1F2\SQLEXPRESS;'
                        'Database=ProhOrt-Mvp;'
                        'Trusted_Connection=yes;')

def fillCursos():
    conn = conection()
    
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM Curso')
    
    for i in cursor:
        cursos.append(i)

def fillAulas():
    conn = conection()
    
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM Aula')
    
    for aula in cursor:
        aulas.append(aula)

def fillProfesores():
    conn = conection()
    
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM Profesor')
    
    for profesor in cursor:
        profesores.append(profesor)

def fillBloques():
    conn = conection()
    
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM Bloque')
    
    for bloque in cursor:
        bloques.append(bloque)

def fillAnios():
    conn = conection()
    
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM Anio')
    
    for i in cursor:
        anios.append(i)

def fillOrientaciones():
    conn = conection()
    
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM Orientacion')
    
    for i in cursor:
        orientaciones.append(i)

def fillMaterias():
    conn = conection()
    
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM Materia')
    
    for i in cursor:
        materias.append(i)

def fillProfesorxMaterias():
    conn = conection()
            
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM ProfesorxMateria')
    
    for i in cursor:
        profesorxMaterias.append(i)

def fillEverything():
    fillCursos()
    fillAulas()
    fillProfesores()
    fillBloques()
    fillAnios()
    fillOrientaciones()
    fillMaterias()
    fillProfesorxMaterias()
    print("Todo fue llenado correctamente")

fillEverything()