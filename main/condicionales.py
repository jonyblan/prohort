from finales import finalIncorrecto as incorrecto

def condicionalesIniciales(cantCursos, cantAulas, cantProfesores, cantBloques, diasSemana, maxBloquesDia, minBloquesDia, horarioEntrada):
    if(cantAulas < cantCursos):
        incorrecto(1)
    if(cantProfesores < cantCursos):
        incorrecto(2)
    for idCurso in range(cantCursos):
        if(cantBloques[idCurso] < cantCursos):
            incorrecto(3)
        for diaSemana in range(diasSemana):
            if(maxBloquesDia[idCurso][diaSemana] - minBloquesDia[idCurso][diaSemana] < 0):
                incorrecto(10)
            elif((maxBloquesDia[idCurso] == -1 and minBloquesDia[idCurso] != -1) or (maxBloquesDia[idCurso] != -1 and minBloquesDia[idCurso] == -1)):
                incorrecto(11)
            elif(horarioEntrada[idCurso][diaSemana][1] - horarioEntrada[idCurso][diaSemana][0] < 0):
                incorrecto(12)
            elif(maxBloquesDia[idCurso][diaSemana] - minBloquesDia[idCurso][diaSemana]) < horarioEntrada[idCurso][diaSemana][0]:
                incorrecto(9)