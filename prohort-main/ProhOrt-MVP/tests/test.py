import math
from socket import NI_NUMERICSERV

class Materia:
    def __init__(self, _id, _nombre, _prioridad, _numBloques):
        self.id = _id
        self.nombre = _nombre
        self.prioridad = _prioridad
        self.numBloques = _numBloques

class DatosBloque:
    def __init__(self, _dia, _numBloque, _numCurso, _idProfesor, _idAula, _idMateria):
        self.dia = _dia
        self.numBloque = _numBloque
        self.numCurso = _numCurso
        self.idProfesor = _idProfesor
        self.idAula = _idAula
        self.idMateria = _idMateria

def error(code):
    print("ERROR CODE " + str(code))
    exit()

def final(msg):
    print(msg)
    print("continue para borrar los datos")
    exit()

# Variables que vendrian del programa
# El orden de estos objetos es [[disponibilidadBloque1, disponibilidadBloque2, disponibilidadBloque3][same]]. Cada uno es un curso
curso  = [[[1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1]], [[1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1]], [[1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1]]]
profesor  = [[[1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1]], [[1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1]], [[1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1]]]
aula  = [[[1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1]], [[1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1]], [[1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1]]]
materia = []
materia.append([])
materia[0].append(Materia(0, "materia 1", 1, 8))
materia[0].append(Materia(1, "materia 2", 1, 8))
materia[0].append(Materia(2, "materia 3", 1, 8))
materia.append([])
materia[1].append(Materia(0, "materia 1", 1, 8))
materia[1].append(Materia(1, "materia 2", 1, 8))
materia[1].append(Materia(2, "materia 3", 1, 8))
materia.append([])
materia[2].append(Materia(0, "materia 1", 1, 8))
materia[2].append(Materia(1, "materia 2", 1, 8))
materia[2].append(Materia(2, "materia 3", 1, 8))

# el orden de los bloques es [[(numBloque, (id)curso, (id)profesor, (id)aula][same]]. Cada uno es un bloque

# Variables que deberian estar ingresadas por el usuario
maxBloquesDia = [[5, 5, 5, 5, 5, -1, -1], [5, 5, 5, 5, 5, -1, -1], [5, 5, 5, 5, 5, -1, -1]] # falta automatizar por cantidad de cursos
minBloquesDia = [[3, 3, 3, 3, 3, -1, -1], [3, 3, 3, 3, 3, -1, -1], [3, 3, 3, 3, 3, -1, -1]] # falta automatizar por cantidad de cursos
bloquesDiaReal = [[0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0]] # falta automatizar por cantidad de cursos
cantBloquesReal = [20, 20, 20]  # falta automatizar por cantidad de cursos
cantBloquesOcupados = [0, 0, 0]  # falta automatizar por cantidad de cursos
# horarioEntrada va del -2 a maxBloquesDia, hay 14 valores y representan el bloque de entrada minimo y maximo por dia. -1 indica que ese dia no hay clase, -2 que es cualquier horario (siempre que de resultados), y x>=0 los bloquesAux
horarioEntrada = [[[1, 1], [0, 0], [0, 0], [0, 0], [0, 0], [-1, -1], [-1, -1]], [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [-1, -1], [-1, -1]], [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [-1, -1], [-1, -1]]]  # falta automatizar por cantidad de cursos y dias

# Variables que se llenan acorde al usuario
# bloquesxDia va del -3 al 7 inclusive: -3 significa que ya fue asignado, -2 significa que no hay clase en todo el dia, -1 significa que en ese bloque no hay clase, 0 que todavia no fue asignado (no deberia quedar ninguno cuando finaliza la ejecucion), y del 1 al 7 la prioridad de llenar el bloque
bloquesxDia = [] #bloquesxDia[numCurso][numDiaDeSemana][numBloque]
bloquesAux = []
diasSemana = len(maxBloquesDia[0])
cantCursos = len(curso)

# Aca empieza la logica
maxBloques = 0
maxCantBloques = 0
diasSemanaEscuela = [0, 0, 0]
cantBloques = [0, 0, 0]

def declaracionesIniciales():
    for numCurso in range(cantCursos):
        for i in range(diasSemana):
            if maxBloquesDia[numCurso][i] != -1:
                diasSemanaEscuela[numCurso] = diasSemanaEscuela[numCurso] + 1
                if(maxBloquesDia[numCurso][i] > maxCantBloques):
                    maxCantBloques = maxBloquesDia[numCurso][i]
        cantBloques[numCurso] = maxCantBloques*diasSemanaEscuela[numCurso]

    for b in range(cantCursos):
        bloquesxDia.append([])
        for i in range(diasSemana):
            bloquesxDia[b].append([])
            for a in range(maxCantBloques):
                bloquesxDia[b][i].append(0)

def condicionalesIniciales():
    for idCurso in range(cantCursos):
        for diaSemana in range(diasSemana):
            if(maxBloquesDia[idCurso][diaSemana] - minBloquesDia[idCurso][diaSemana] < 0):
                error(10)
            elif((maxBloquesDia[idCurso] == -1 and minBloquesDia[idCurso] != -1) or (maxBloquesDia[idCurso] != -1 and minBloquesDia[idCurso] == -1)):
                error(11)
            elif(horarioEntrada[idCurso][diaSemana][1] - horarioEntrada[idCurso][diaSemana][0] < 0):
                error(12)
            elif(maxBloquesDia[idCurso][diaSemana] - minBloquesDia[idCurso][diaSemana]) < horarioEntrada[idCurso][diaSemana][0]:
                error(9)
            elif(horarioEntrada[idCurso][diaSemana][0] >= 0 and maxBloquesDia[idCurso][diaSemana] >= 0):
                #for numCurso in range(cantCursos):
                    if(maxBloquesDia[idCurso][diaSemana] != -1):
                        for hora in range(horarioEntrada[idCurso][diaSemana][0]):
                            bloquesxDia[idCurso][diaSemana][hora] = -1
                    if(maxBloquesDia[idCurso][diaSemana] - horarioEntrada[idCurso][diaSemana][0] == minBloquesDia[idCurso][diaSemana]):
                        for hora in range(horarioEntrada[idCurso][diaSemana][0], maxCantBloques):
                            bloquesxDia[idCurso][diaSemana][hora] = 7
            elif(maxBloquesDia[idCurso][diaSemana] == -1):
                #for numCurso in range(cantCursos):
                    for bloque in range(maxCantBloques):
                        bloquesxDia[idCurso][diaSemana][bloque] = -2
            else:
                error(13)

def checkearDisponibilidad(disponibilidad, dia, numBloque, numArray, idLlamador):
    if(disponibilidad[dia][numBloque] == 1 or disponibilidad[dia][numBloque] == "1"):
        return True
    elif(disponibilidad[dia][numBloque] == 0 or disponibilidad[dia][numBloque] == "0"):
        return False

def cambiarDatos(dbq):
    curso[dbq.numCurso][dbq.dia][dbq.numBloque] = 0
    profesor[dbq.idProfesor][dbq.dia][dbq.numBloque] = 0
    aula[dbq.idAula][dbq.dia][dbq.numBloque] = 0
    materia[dbq.numCurso][dbq.idMateria].numBloques = materia[dbq.numCurso][dbq.idMateria].numBloques - 1
    bloquesxDia[dbq.numCurso][dbq.dia][dbq.numBloque] = -3
    cantBloquesOcupados[dbq.numCurso] = cantBloquesOcupados[dbq.numCurso] + 1
    bloquesDiaReal[dbq.numCurso][dbq.dia] = bloquesDiaReal[dbq.numCurso][dbq.dia] + 1

def guardarBloque(dbq):
    bloquesAux.append([dbq.dia, dbq.numBloque, dbq.numCurso, dbq.idProfesor, dbq.idAula, dbq.idMateria])

def avisarConsola(idBloque):
    if(idBloque == -1):
        idBloque = len(bloquesAux)
    print("Bloque completo: " + str(bloquesAux[idBloque]))

def nuevoBloque(datosBloque, idBloque):
    guardarBloque(datosBloque)
    cambiarDatos(datosBloque)
    avisarConsola(idBloque)

def forzarBloque(dia, numBloque, numCurso, idProfesor, idAula, idMateria):
    if(curso[numCurso][dia][numBloque] == 0 or profesor[idProfesor][dia][numBloque] == 0 or aula[idAula][dia][numBloque] == 0 or materia[numCurso][dia][idMateria].numBloques == 0):
        error(8)
    else:
        datosBloque = DatosBloque(dia, numBloque, numCurso, idProfesor, idAula, materia[numCurso][idMateria].id)
        nuevoBloque(datosBloque, -1)

def elegirMateria(numCurso):
    for idMateria in range(len(materia[numCurso])):
        if(materia[numCurso][idMateria].numBloques > 0):
            return idMateria
    return -1

def elegirCursoBloque(dia, numBloque):
    for idCurso in range(len(curso)):
        if(checkearDisponibilidad(curso[idCurso], dia, numBloque, idCurso, 0)):
            return idCurso
    return -1

def elegirProfesor(dia, numBloque):
    for idProfesor in range(len(profesor)):
        if(checkearDisponibilidad(profesor[idProfesor], dia, numBloque, idProfesor, 1)):
            return idProfesor
    return -1

def elegirAula(dia, numBloque):
    for idAula in range(len(aula)):
        if(checkearDisponibilidad(aula[idAula], dia, numBloque, idAula, 2)):
            return idAula
    return -1

def elegirCurso():
    for numCurso in range(cantCursos):
        if(cantBloquesOcupados[numCurso] < cantBloquesReal[numCurso]):
            return numCurso
    return -1

def llenarDatosBloque(numCurso, dia, numBloque):
    idMateria = elegirMateria(numCurso)
    idProfesor = elegirProfesor(dia, numBloque)
    idAula = elegirAula(dia, numBloque)
    return (DatosBloque(dia, numBloque, numCurso, idProfesor, idAula, idMateria))

def verificacionFinal(todosContados):
    if(todosContados):
        for numCurso in range(cantCursos):
            for numBloque in range(len(bloquesxDia[numCurso])):
                if(bloquesxDia[numCurso][numBloque] == 0):
                    bloquesxDia[numCurso][numBloque] = -4
        print(bloquesxDia)
        print(bloquesDiaReal)
        final("se llenaron todos los bloques")
    print(bloquesxDia)
    print("")
    error(4)

def llenarBloque(vuelta):
    for numCurso in range(cantCursos):
        if(cantBloquesOcupados[numCurso] < cantBloquesReal[numCurso]):
            for preNumBloque in range(cantBloques[numCurso]):
                dia = preNumBloque%maxCantBloques
                numBloque = math.trunc(preNumBloque/maxCantBloques)
                datosBloque = llenarDatosBloque(numCurso, dia, numBloque)
                if(datosBloque.idAula != -1 and datosBloque.idProfesor != -1 and datosBloque.idMateria != -1):
                    if(bloquesxDia[numCurso][dia][numBloque] >= 0):
                        nuevoBloque(datosBloque, vuelta)
                        return 1
    todosContados = True
    for i in range(cantCursos):
        if(cantBloquesOcupados[i] != cantBloquesReal[i]):
            todosContados = False
            print(bloquesxDia)
            error(4)
    verificacionFinal(todosContados)

def preInicio():
    declaracionesIniciales()
    condicionalesIniciales()

def llenarBloques():
    preInicio()
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