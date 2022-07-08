for diaSemana in range(diasSemana):
    if(maxBloquesDia[diaSemana] - minBloquesDia[diaSemana] < 0):
        error(10)
    elif((maxBloquesDia == -1 and minBloquesDia != -1) or (maxBloquesDia != -1 and minBloquesDia == -1)):
        error(11)
    elif(horarioEntrada[diaSemana][1] - horarioEntrada[diaSemana][0] < 0):
        error(12)
    elif(maxBloquesDia[diaSemana] - minBloquesDia[diaSemana]) < horarioEntrada[diaSemana][0]:
        error(9)
    elif(horarioEntrada[diaSemana][0] >= 0 and maxBloquesDia[diaSemana] >= 0):
        for b in range(diasSemana):
            if(maxBloquesDia[b] != -1):
                for hora in range(horarioEntrada[diaSemana][0]):
                    bloquesxDia[diaSemana*5+hora] = -1
            elif(maxBloquesDia[b] == -1):
                for bloque in range(maxCantBloques):
                    bloquesxDia[bloque+5*b] = -2
            else:
                error(13)
            if(maxBloquesDia[b] - horarioEntrada[b][0] == minBloquesDia[b]):
                for a in range(horarioEntrada[b][0], maxCantBloques):
                    bloquesxDia[a+5*b] = 7

for diaSemana in range(diasSemana):
    if(maxBloquesDia[diaSemana] - minBloquesDia[diaSemana] < 0):
        error(10)
    elif((maxBloquesDia == -1 and minBloquesDia != -1) or (maxBloquesDia != -1 and minBloquesDia == -1)):
        error(11)
    elif(horarioEntrada[diaSemana][1] - horarioEntrada[diaSemana][0] < 0):
        error(12)
    elif(maxBloquesDia[diaSemana] - minBloquesDia[diaSemana]) < horarioEntrada[diaSemana][0]:
        error(9)
    elif(horarioEntrada[diaSemana][0] >= 0 and maxBloquesDia[diaSemana] >= 0):
        #for b in range(diasSemana):
        if(maxBloquesDia[i] != -1):
            for hora in range(horarioEntrada[diaSemana][0]):
                bloquesxDia[diaSemana*5+hora] = -1
        elif(maxBloquesDia[i] == -1):
            for bloque in range(maxCantBloques):
                bloquesxDia[bloque+5*diaSemana] = -2
        else:
            error(13)
        if(maxBloquesDia[diaSemana] - horarioEntrada[diaSemana][0] == minBloquesDia[diaSemana]):
            for a in range(horarioEntrada[diaSemana][0], maxCantBloques):
                bloquesxDia[a+5*diaSemana] = 7