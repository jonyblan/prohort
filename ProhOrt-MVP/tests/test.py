def error(code):
    print("ERROR CODE " + str(code))
    exit()

# Variables que vendrian del programa
# El orden de estos objetos es [[disponibilidadBloque1, disponibilidadBloque2, disponibilidadBloque3][same]]. Cada uno es un curso
curso  = [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]]
profesor  = [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]]
aula  = [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]]
# el orden de los bloques es [[(numBloque, (id)curso, (id)profesor, (id)aula][same]]. Cada uno es un bloque

# Variables que deberian estar ingresadas por el usuario
maxBloquesDia = [5, 5, 5, 5, 5, -1, -1]
minBloquesDia = [3, 3, 3, 3, 3, -1, -1]
cantBloques = 20
# horarioEntrada va del -2 a maxBloquesDia, hay 14 valores y representan el bloque de entrada minimo y maximo por dia. -1 indica que ese dia no hay clase, -2 que es cualquier horario (siempre que de resultados), y x>=0 los bloques
horarioEntrada = [[1, 2], [2, 2], [0, 0], [1, 1], [0, 0], [-1, -1], [-1, -1]]

# Variables que se llenan acorde al usuario
# bloquesxDia va del -2 al 7 inclusive: -2 significa que no hay clase en todo el dia, -1 significa que en ese bloque no hay clase, 0 que todavia no fue asignado (no deberia quedar ninguno cuando finaliza la ejecucion), y del 1 al 7 la prioridad de llenar el bloque
bloquesxDia = []
bloques = []
diasSemana = len(maxBloquesDia)

# Aca empieza la logica
maxBloques = 0
maxCantBloques = 0
for i in range(diasSemana):
    if maxBloquesDia[i] != -1:
        if(maxBloquesDia[i] > maxCantBloques):
            maxCantBloques = maxBloquesDia[i]

for i in range(diasSemana):
    for a in range(maxCantBloques):
        bloquesxDia.append(0)

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
        if(maxBloquesDia[diaSemana] != -1):
            for hora in range(horarioEntrada[diaSemana][0]):
                bloquesxDia[diaSemana*5+hora] = -1
        if(maxBloquesDia[diaSemana] - horarioEntrada[diaSemana][0] == minBloquesDia[diaSemana]):
            for hora in range(horarioEntrada[diaSemana][0], maxCantBloques):
                bloquesxDia[hora+5*diaSemana] = 7
    elif(maxBloquesDia[diaSemana] == -1):
        for bloque in range(maxCantBloques):
            bloquesxDia[bloque+5*diaSemana] = -2
    else:
        error(13)




print(bloquesxDia)
exit()



for i in range(diasSemana):
    for a in range(minBloquesDia[i]):
        bloquesxDia[a+5*i] = i+1


def checkearDisponibilidad(disponibilidad, numBloque, numArray, idLlamador):
    if(disponibilidad[numBloque] == 1 or disponibilidad[numBloque] == "1"):
        return True
    elif(disponibilidad[numBloque] == 0 or disponibilidad[numBloque] == "0"):
        return False

def forzarBloque(numBloque, idCurso, idProfesor, idAula):
    if(curso[idCurso][numBloque] == 0 or profesor[idProfesor][numBloque] == 0 or aula[idAula][numBloque] == 0):
        error(8)
    else:
        bloques.append([numBloque, idCurso, idProfesor, idAula])
        curso[idCurso][numBloque] = 0
        profesor[idProfesor][numBloque] = 0
        aula[idAula][numBloque] = 0

def llenarBloque(vuelta):
    for numBloque in range(cantBloques):
        idCurso = 0
        for idCurso in range(len(curso)):
            if(bloquesxDia[numBloque] > 0):
                if(checkearDisponibilidad(curso[idCurso], numBloque, idCurso, 0)):
                    idProfesor = 0
                    for idProfesor in range(len(profesor)):
                        if(checkearDisponibilidad(profesor[idProfesor], numBloque, idProfesor, 1)):
                            idAula = 0
                            for idAula in range(len(aula)):
                                if(checkearDisponibilidad(aula[idAula], numBloque, idAula, 2)):
                                    curso[idCurso][numBloque] = 0
                                    profesor[idProfesor][numBloque] = 0
                                    aula[idAula][numBloque] = 0
                                    bloques.append([numBloque, idCurso, idProfesor, idAula])
                                    print("Bloque completo: " + str(bloques[vuelta]))
                                    return 1
    error(4)

def llenarBloques():
    vueltas = -1
    if vueltas != -1:
        for i in range(vueltas):
            llenarBloque(i)
    else:
        i = 0
        while True:
            llenarBloque(i)
            i = i + 1
    print("Llego al final. Continuar para borrar datos")
    print("")

llenarBloques()