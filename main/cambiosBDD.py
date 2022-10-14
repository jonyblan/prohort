import pyodbc
from finales import finalIncorrecto

def anotarBloque(dbq, cursos, profesores, aulas, materias):
    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=A-PHZ2-CIDI-052;'
                        'Database=ProhOrt-Mvp;'
                        'Trusted_Connection=yes;')

    cursor = conn.cursor()
    
    cursor.execute('INSERT INTO Bloque (IdDia, NumBloque, IdCurso, IdProfesor, IdAula, IdMateria) VALUES ('  + str(dbq.dia) + ', ' + str(dbq.numBloque) + ', ' + str(cursos[dbq.numCurso].IdCurso) + ', ' + str(profesores[dbq.idProfesor].IdProfesor) + ', ' + str(aulas[dbq.idAula].IdAula) + ', ' + str(materias[dbq.idMateria].IdMateria) + ')')

    conn.commit()

def vaciarBloques(terminar):
    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=A-PHZ2-CIDI-052;'
                        'Database=ProhOrt-Mvp;'
                        'Trusted_Connection=yes;')
    
    cursor = conn.cursor()
    
    cursor.execute('DELETE FROM Bloque')
    
    conn.commit()
    
    if terminar: exit()

def ponerComoDefault(devolver, exacto, terminar):
    if(exacto == False):
        if(devolver != 0):
            finalIncorrecto(14)
    devolver = str(devolver)
    
    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=A-PHZ2-CIDI-052;'
                        'Database=ProhOrt-Mvp;'
                        'Trusted_Connection=yes;')
    
    cursor = conn.cursor()
    cursor.execute('UPDATE Curso SET Disponibilidad = ' + devolver)
    cursor.execute('UPDATE Aula SET Disponibilidad = ' + devolver)
    cursor.execute('UPDATE Profesor SET Disponibilidad = ' + devolver)
    cursor.execute('DELETE FROM Bloque')
    #cursor.execute('UPDATE Anio SET CargaHoraria = ' + devolver)
    #cursor.execute('UPDATE Orientacion SET [columna] = [valor default]')
    #cursor.execute('UPDATE Materia SET [columna] = [valor default]')
    #cursor.execute('DELETE FROM Bloque')

    conn.commit()
    print("Todo se puso como default correctamente")
    
    if terminar: exit()