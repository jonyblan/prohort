import finales

def condicionalesIniciales(cantCursos, cantAulas, cantProfesores, cantBloques, diasSemana, maxBloquesDia, minBloquesDia, horarioEntrada):
    if(cantAulas < cantCursos):
        finales.finalIncorrecto(1)
    if(cantProfesores < cantCursos):
        finales.finalIncorrecto(2)
    for idCurso in range(cantCursos):
        if(cantBloques[idCurso] < cantCursos):
            finales.finalIncorrecto(3)
        for diaSemana in range(diasSemana):
            if(maxBloquesDia[idCurso][diaSemana] - minBloquesDia[idCurso][diaSemana] < 0):
                finales.finalIncorrecto(10)
            elif((maxBloquesDia[idCurso] == -1 and minBloquesDia[idCurso] != -1) or (maxBloquesDia[idCurso] != -1 and minBloquesDia[idCurso] == -1)):
                finales.finalIncorrecto(11)
            elif(horarioEntrada[idCurso][diaSemana][1] - horarioEntrada[idCurso][diaSemana][0] < 0):
                finales.finalIncorrecto(12)
            elif(maxBloquesDia[idCurso][diaSemana] - minBloquesDia[idCurso][diaSemana]) < horarioEntrada[idCurso][diaSemana][0]:
                finales.finalIncorrecto(9)