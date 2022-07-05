# Variables que vendrian del programa
# El orden de estos objetos es [[disponibilidadBloque1, disponibilidadBloque2, disponibilidadBloque3][same]]. Cada uno es un curso
curso  = [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]]
profesor  = [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]]
aula  = [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]]
# el orden de los bloques es [[(numBloque, (id)curso, (id)profesor, (id)aula, (id)d, (id)e)][same]]. Cada uno es un bloque

# Variables que deberian estar ingresadas por el usuario
maxBloquesDia = [5, 5, 5, 5, 5, -1, -1]
minBloquesDia = [3, 3, 3, 3, 3, -1, -1]
cantBloques = 20
# horarioEntrada va del -1 a maxBloquesDia, hay 14 valores y representan el bloque de entrada minimo y maximo por dia
horarioEntrada = [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]

# Variables que se llenan acorde al usuario
# bloquesxDia va del -1 al 7 inclusive: -1 significa que no hay clase, 0 que todavia no fue asignado (no deberia quedar ninguno cuando finaliza la ejecucion, y del 1 al 7 los dias de la semana)
bloquesxDia = []
bloques = []


# Aca empieza la logica
maxBloques = 0
for i in range(diasSemana):
    if maxBloquesDia[i] != -1:
        maxBloques = maxBloques + maxBloquesDia[i]
    
for i in range(maxBloques):
    bloquesxDia.append(-1)

for i in range(diasSemana):
    for a in range(minBloquesDia[i]):
        bloquesxDia[a+5*i] = i+1

def error(code):
    print("ERROR CODE " + str(code))
    exit()

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