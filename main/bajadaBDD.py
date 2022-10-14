import pyodbc

def fillEverything(aulas, profesores, cursos, bloques, dias, anios, orientaciones, materias, profesorxMaterias):
    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=A-PHZ2-CIDI-052;'
                        'Database=ProhOrt-Mvp;'
                        'Trusted_Connection=yes;')
    
    cursor = conn.cursor()
    
    cursor.execute('SELECT * FROM Aula')
    for aula in cursor:
        aulas.append(aula)
        
    cursor.execute('SELECT * FROM Profesor')
    for profesor in cursor:
        profesores.append(profesor)
    
    cursor.execute('SELECT * FROM Curso')
    for curso in cursor:
        cursos.append(curso)
    
    cursor.execute('SELECT * FROM Bloque')
    for bloque in cursor:
        bloques.append(bloque)
    
    cursor.execute('SELECT * FROM Dia')
    for dia in cursor:
        dias.append(dia)
    
    cursor.execute('SELECT * FROM Anio')
    for i in cursor:
        anios.append(i)
    
    cursor.execute('SELECT * FROM Orientacion')
    for i in cursor:
        orientaciones.append(i)
    
    cursor.execute('SELECT * FROM Materia')
    for i in cursor:
        materias.append(i)

    cursor.execute('SELECT * FROM ProfesorxMateria')
    for i in cursor:
        profesorxMaterias.append(i)