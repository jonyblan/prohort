from verificaciones import checkearDisponibilidad

def elegirMateria(numCurso, cantMaterias, materias):
    for idMateria in range(cantMaterias):
        if(materias[idMateria].NumBloques[numCurso] > 0):
            return idMateria
    return -1

def elegirProfesor(dia, numBloque, cantProfesores, profesores):
    for idProfesor in range(cantProfesores):
        if(checkearDisponibilidad(profesores[idProfesor].Disponibilidad, dia, numBloque, idProfesor, 1)):
            return idProfesor
    return -1

def elegirAula(dia, numBloque, cantAulas, aulas):
    for idAula in range(cantAulas):
        if(checkearDisponibilidad(aulas[idAula].Disponibilidad, dia, numBloque, idAula, 2)):
            return idAula
    return -1
