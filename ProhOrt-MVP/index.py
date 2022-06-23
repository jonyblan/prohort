from asyncio.windows_events import NULL
import pyodbc
from fill import fillEverything

cursos = []
profesores = []
aulas = []
bloques = []
resultados = []
anios = []
orientaciones = []
materias = []
profesorxMaterias = []
cantBloquesTotales = 3

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

fillEverything()

def checkearDisponibilidad(disponibilidad, numBloque, idLlamador):
    numeroAUsar = 10**(cantBloquesTotales - numBloque)
    disponibilidad = disponibilidad/numeroAUsar
    redondeado = round(disponibilidad)
    if(redondeado%10 == 0):
        return False
    else:
        return True

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

def codigo():
    abc = 0
    for numBloque in range (1, cantBloques):
        for i in range(cantCursos):
            if(checkearDisponibilidad(cursos[i].Disponibilidad, numBloque, 2)):
                for a in range(cantProfesores):
                    if(checkearDisponibilidad(profesores[a].Disponibilidad, numBloque, 3)):
                        for b in range(cantAulas):
                            if(checkearDisponibilidad(aulas[b].Disponibilidad, numBloque, 4)):
                                nuevoResultado = [numBloque, i, a, b]
                                resultados.append(nuevoResultado)
                                mostrarResultados(numBloque, i, a, b)
                                anotarClase(bloques[numBloque].IdBloque, cursos[i].IdCurso, profesores[a].IdProfesor, aulas[b].IdAula, numBloque)
                                exit()
                                abc = abc + 1
                                if(abc == 4):
                                    exit()
    print("ERROR CODE 4")
    exit()

def mostrarResultados(numBloque, i, a, b):
    print("NumBloque: ", numBloque)
    print("Bloque: ", bloques[numBloque].IdBloque)
    print("Curso: ", cursos[i].IdCurso)
    print("Profesor: ", profesores[a].IdProfesor)
    print("Aula: ", aulas[b].IdAula)
    print(resultados) # Default: 1, 0, 0, 0



# Espacio para ejecutar funciones

codigo() # Ejecuta el codigo principal
ponerComoDefault() # Devuelve los valores de las disponibilidades al default