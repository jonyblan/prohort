import pyodbc
dias = []
cursos = []

def fillEverything():
    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=A-PHZ2-CIDI-052;'
                        'Database=ProhOrt-Mvp;'
                        'Trusted_Connection=yes;')
    
    cursor = conn.cursor()
    
    cursor.execute('SELECT * FROM Dia')
    for dia in cursor:
        dias.append(dia)
    
    cursor.execute('SELECT * FROM Curso')
    for curso in cursor:
        cursos.append(curso)
    
    print("Todo fue llenado correctamente")

fillEverything()

diasSemana = 7

cantCursos = len(cursos)
cantDias = len(dias)
idCursos = []
for numCurso in range (cantCursos):
    idCursos.append(cursos[numCurso].IdCurso)
maxBloquesDia = []
for i in range (cantCursos):
    maxBloquesDia.append([])
    for a in range (diasSemana+1):
        for dia in range (cantDias):
            if(dias[dia].DiaSemana == a and dias[dia].IdCurso) == idCursos[i]:
                maxBloquesDia[i].append(dias[dia].MaxBloques)

print(maxBloquesDia)