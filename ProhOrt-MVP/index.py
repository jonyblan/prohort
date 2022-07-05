from asyncio.windows_events import NULL
import pyodbc
import fill

from services.db import DB

sql = DB('Driver={SQL Server};'
        'Server=LAPTOP-7789D1F2\SQLEXPRESS;'
        'Database=ProhOrt-Mvp;'
        'Trusted_Connection=yes;')

sql.FillCursos()

# Llenar datos

cantBloquesTotales = 3
cursos = []
profesores = []
aulas = []
bloques = []
resultados = []
anios = []
orientaciones = []
materias = []
profesorxMaterias = []

def fillCursos():
    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=LAPTOP-7789D1F2\SQLEXPRESS;'
                        'Database=ProhOrt-Mvp;'
                        'Trusted_Connection=yes;')
    
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM Curso')
    cursos = [curso for curso in cursor]


def fillAulas():
    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=LAPTOP-7789D1F2\SQLEXPRESS;'
                        'Database=ProhOrt-Mvp;'
                        'Trusted_Connection=yes;')
    
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM Aula')
    
    for aula in cursor:
        aulas.append(aula)

def fillProfesores():
    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=LAPTOP-7789D1F2\SQLEXPRESS;'
                        'Database=ProhOrt-Mvp;'
                        'Trusted_Connection=yes;')
    
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM Profesor')
    
    for profesor in cursor:
        profesores.append(profesor)

def fillBloques():
    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=LAPTOP-7789D1F2\SQLEXPRESS;'
                        'Database=ProhOrt-Mvp;'
                        'Trusted_Connection=yes;')
    
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM Bloque')
    
    for bloque in cursor:
        bloques.append(bloque)

def fillAnios():
            conn = pyodbc.connect('Driver={SQL Server};'
                                'Server=LAPTOP-7789D1F2\SQLEXPRESS;'
                                'Database=ProhOrt-Mvp;'
                                'Trusted_Connection=yes;')
            
            cursor = conn.cursor()
            cursor.execute('SELECT * FROM Anio')
            
            for i in cursor:
                anios.append(i)

def fillOrientaciones():
            conn = pyodbc.connect('Driver={SQL Server};'
                                'Server=LAPTOP-7789D1F2\SQLEXPRESS;'
                                'Database=ProhOrt-Mvp;'
                                'Trusted_Connection=yes;')
            
            cursor = conn.cursor()
            cursor.execute('SELECT * FROM Orientacion')
            
            for i in cursor:
                orientaciones.append(i)

def fillMaterias():
            conn = pyodbc.connect('Driver={SQL Server};'
                                'Server=LAPTOP-7789D1F2\SQLEXPRESS;'
                                'Database=ProhOrt-Mvp;'
                                'Trusted_Connection=yes;')
            
            cursor = conn.cursor()
            cursor.execute('SELECT * FROM Materia')
            
            for i in cursor:
                materias.append(i)

def fillProfesorxMaterias():
            conn = pyodbc.connect('Driver={SQL Server};'
                                'Server=LAPTOP-7789D1F2\SQLEXPRESS;'
                                'Database=ProhOrt-Mvp;'
                                'Trusted_Connection=yes;')
            
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

def anotarClase(bloque, curso, profesor, aula, numBloque):
    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=LAPTOP-7789D1F2\SQLEXPRESS;'
                        'Database=ProhOrt-Mvp;'
                        'Trusted_Connection=yes;')

    cursor = conn.cursor()
    
    bloqueEnCodigo = str(10**(cantBloquesTotales - numBloque))
    
    cursor.execute('UPDATE Curso SET Disponibilidad = Disponibilidad - ' + bloqueEnCodigo + ' WHERE IdCurso = ' + str(curso))
    cursor.execute('UPDATE Profesor SET Disponibilidad = Disponibilidad - ' + bloqueEnCodigo + ' WHERE IdProfesor = ' + str(profesor))
    cursor.execute('UPDATE Aula SET Disponibilidad = Disponibilidad - ' + bloqueEnCodigo + ' WHERE IdAula = ' + str(aula))
    cursor.execute('INSERT INTO Bloque (IdProfesor, IdAula, IdCurso) VALUES (' + str(profesor) + ', ' + str(aula) + ', ' + str(curso) + ')')
    
    conn.commit()

def ponerComoDefault():
    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=LAPTOP-7789D1F2\SQLEXPRESS;'
                        'Database=ProhOrt-Mvp;'
                        'Trusted_Connection=yes;')
    
    cursor = conn.cursor()
    cursor.execute('UPDATE Curso SET Disponibilidad = 111')
    cursor.execute('UPDATE Aula SET Disponibilidad = 111')
    cursor.execute('UPDATE Profesor SET Disponibilidad = 111')
    cursor.execute('UPDATE Anio SET CargaHoraria = 333')
    #cursor.execute('UPDATE Orientacion SET [columna] = [valor default]')
    #cursor.execute('UPDATE Materia SET [columna] = [valor default]')
    #cursor.execute('DELETE FROM Bloque')

    conn.commit()

def bajarTabla(tableName):
    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=LAPTOP-7789D1F2\SQLEXPRESS;'
                        'Database=ProhOrt-Mvp;'
                        'Trusted_Connection=yes;')
    
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM ' + tableName)
    
    for i in cursor:
        tableName.append(i)

# Declaraciones Basicas
cantCursos = len(cursos) #3
cantAulas = len(aulas) #5
cantProfesores = len(profesores) #5
cantBloques = len(bloques) #9 (3 por curso)
cantAnio = len(anios)
cantOrientacion = len(orientaciones)
cantMateria = len(materias)
cantProfesorxMateria = len(profesorxMaterias)

# Condicionales basicos
if(cantAulas < cantCursos):
    print("ERROR CODE 1")
    exit()

if(cantProfesores < cantCursos):
    print("ERROR CODE 2")
    exit()

if(cantBloques < cantCursos):
    print("ERROR CODE 3")
    exit()

print(cantCursos)

def error(code):
    print("ERROR CODE " + str(code))
    exit()

def checkearDisponibilidad(disponibilidad, numBloque, numArray, idLlamador):
    if(disponibilidad[numBloque] == 1 or disponibilidad[numBloque] == "1"):
        return True
    elif(disponibilidad[numBloque] == 0 or disponibilidad[numBloque] == "0"):
        return False
    error(6)

def forzarBloque(numBloque, idCurso, idProfesor, idAula):
    if(cursos[idCurso][numBloque] == 0 or profesores[idProfesor][numBloque] == 0 or aulas[idAula][numBloque] == 0):
        error(8)
    else:
        bloques.append([numBloque, idCurso, idProfesor, idAula])
        cursos[idCurso][numBloque] = 0
        profesores[idProfesor][numBloque] = 0
        aulas[idAula][numBloque] = 0

def llenarBloque(vuelta):
    for numBloque in range(cantBloques+1):
        idCurso = 0
        for idCurso in range(cantCursos):
            if(checkearDisponibilidad(cursos[idCurso].disponibilidad, numBloque, idCurso, 0)):
                idProfesor = 0
                for idProfesor in range(cantProfesores):
                    if(checkearDisponibilidad(profesores[idProfesor].disponibilidad, numBloque, idProfesor, 1)):
                        idAula = 0
                        for idAula in range(cantAulas):
                            if(checkearDisponibilidad(aulas[idAula].disponibilidad, numBloque, idAula, 2)):
                                cursos[idCurso][numBloque] = 0
                                profesores[idProfesor][numBloque] = 0
                                aulas[idAula][numBloque] = 0
                                bloques.append([numBloque, idCurso, idProfesor, idAula])
                                print("Bloque completo: " + str(bloques[vuelta]))
                                return 1
    error(4)

def llenarBloques():
    fillEverything()
    vueltas = 10
    for i in range(vueltas):
        llenarBloque(i)
    print("Llego al final. Continuar para borrar datos")
    # Poner un break 
    print("")

# Espacio para ejecutar funciones

llenarBloques() # Ejecuta el codigo principal
ponerComoDefault() # Devuelve los valores de las disponibilidades al default