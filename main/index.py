from asyncio.windows_events import NULL
import pyodbc
import math
from bajadaBDD import fillEverything
import finales
import cambiosBDD
import condicionales
import eleccionDatos
import verificaciones

# from services.db import DB

#sql = DB('Driver={SQL Server};'
#        'Server=A-PHZ2-CIDI-052;'
#        'Database=ProhOrt-Mvp;'
#        'Trusted_Connection=yes;')

#sql.FillCursos()

# Llenar datos

cursos = []
profesores = []
aulas = []
bloques = []
resultados = []
anios = []
orientaciones = []
materias = []
profesorxMaterias = []
dias = []

class Curso:
    def __init__(self, _id, _nombre, _bloquesOcupados, _disponibilidad, _idOrientacion, idAnio, _minBloquesxDia, _maxBloquesxDia, _minEntrada, _maxEntrada):
        self.id = _id
        self.nombre = _nombre
        self.bloquesOcupados = _bloquesOcupados
        self.disponibilidad = _disponibilidad
        self.idOrientacion = _idOrientacion
        self.idAnio = idAnio
        self.minBloquesxDia = _minBloquesxDia
        self.maxBloquesxDia = _maxBloquesxDia
        self.minEntrada = _minEntrada
        self.maxEntrada = _maxEntrada

class Aula:
    def __init__(self, _id, _nombre, _disponibilidad):
        self.id = _id
        self.nombre = _nombre
        self.disponibilidad = _disponibilidad

class Profesor:
    def __init__(self, _id, _nombre, _apellido, _disponibilidad, _minBloquesxDia, _maxBloquesxDia):
        self.id = _id
        self.nombre = _nombre
        self.apellido = _apellido
        self.disponibilidad = _disponibilidad
        self.minBloquesxDia = _minBloquesxDia
        self.maxBloquesxDia = _maxBloquesxDia

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

def bajarTabla(tableName):
    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=A-PHZ2-CIDI-052;'
                        'Database=ProhOrt-Mvp;'
                        'Trusted_Connection=yes;')
    
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM ' + tableName)
    
    for i in cursor:
        tableName.append(i)

# Declaraciones Basicas

def final(msg):
    print(msg)
    print("continue para borrar los datos")
    exit()


maxBloquesDia = []
minBloquesDia = []
bloquesDiaReal = []
cantBloquesReal = []
cantBloquesOcupados = []
# horarioEntrada va del -2 a maxBloquesDia, hay 14 valores y representan el bloque de entrada minimo y maximo por dia. -1 indica que ese dia no hay clase, -2 que es cualquier horario (siempre que de resultados), y x>=0 los bloquesAux
horarioEntrada = []
# Variables que se llenan acorde al usuario
# bloquesxDia va del -3 al 7 inclusive: -3 significa que ya fue asignado, -2 significa que no hay clase en todo el dia, -1 significa que en ese bloque no hay clase, 0 que todavia no fue asignado (no deberia quedar ninguno cuando finaliza la ejecucion), y del 1 al 7 la prioridad de llenar el bloque
bloquesxDia = [] #bloquesxDia[numCurso][numDiaDeSemana][numBloque]
bloquesAux = []
diasSemana = 7

# Aca empieza la logica
maxBloques = 0
maxCantBloques = 0
diasSemanaEscuela = []
cantBloques = []
cantBloquesMax = -1

cantCursos = -1
cantAulas = -1
cantProfesores = -1
cantAnios = -1
cantOrientaciones = -1
cantMaterias = -1
cantProfesorxMaterias = -1
cantDias = -1
idCursos = []
idProfesores = []
idAulas = []
maxBloquesDiaCurso = []

def declaracionesIniciales():
    global cantCursos; cantCursos = len(cursos)
    global cantAulas; cantAulas = len(aulas)
    global cantProfesores; cantProfesores = len(profesores)
    global cantAnios; cantAnios = len(anios)
    global cantOrientaciones; cantOrientaciones = len(orientaciones)
    global cantMaterias; cantMaterias = len(materias)
    global cantProfesorxMaterias; cantProfesorxMaterias = len(profesorxMaterias)
    global cantDias; cantDias = len(dias)
    global maxCantBloques
    global cantBloquesMax
    
    for numCurso in range (cantCursos):
        idCursos.append(cursos[numCurso].IdCurso)
    
    for numProfesor in range (cantProfesores):
        idProfesores.append(profesores[numProfesor].IdProfesor)
    
    for numAula in range (cantAulas):
        idAulas.append(aulas[numAula].IdAula)
    
    for numCurso in range (cantCursos):
        maxBloquesDia.append([])
        minBloquesDia.append([])
        bloquesDiaReal.append([])
        cantBloquesReal.append(cursos[numCurso].BloquesDia)
        cantBloquesOcupados.append(cursos[numCurso].BloquesOcupados)
        diasSemanaEscuela.append(0)
        cantBloques.append(0)
        maxBloquesDiaCurso.append(0)
        
        for dia in range (diasSemana+1):
            for numDia in range (cantDias):
                if(dias[numDia].DiaSemana == dia+1 and dias[numDia].IdCurso) == idCursos[numCurso]:
                    maxBloquesDia[numCurso].append(dias[numDia].MaxBloques)
                    minBloquesDia[numCurso].append(dias[numDia].MinBloques)
        for dia in range(diasSemana):
            bloquesDiaReal[numCurso].append(0)
            if maxBloquesDia[numCurso][dia] != -1:
                diasSemanaEscuela[numCurso] = diasSemanaEscuela[numCurso] + 1
                if(maxBloquesDia[numCurso][dia] > maxCantBloques):
                    maxCantBloques = maxBloquesDia[numCurso][dia]
                if(maxBloquesDia[numCurso][dia] > maxBloquesDiaCurso[numCurso]):
                    maxBloquesDiaCurso[numCurso] = maxBloquesDia[numCurso][dia]
        
    for numCurso in range(cantCursos):
        horarioEntrada.append([])
        bloquesxDia.append([])
        cantBloques[numCurso] = maxBloquesDiaCurso[numCurso]*diasSemanaEscuela[numCurso]
        if(cantBloques[numCurso] > cantBloquesMax):
            cantBloquesMax = cantBloques[numCurso]

        for dia in range(diasSemana):
            bloquesxDia[numCurso].append([])
            for a in range(maxCantBloques):
                bloquesxDia[numCurso][dia].append(0)
    
    for numCurso in range(cantCursos):
        for diaSemana in range(diasSemana):
            horarioEntrada[numCurso].append([])
            for dia in range(cantDias):
                if (dias[dia].IdCurso == idCursos[numCurso] and dias[dia].DiaSemana == diaSemana+1):
                    horarioEntrada[numCurso][diaSemana].append(dias[dia].EntradaMin)
                    horarioEntrada[numCurso][diaSemana].append(dias[dia].EntradaMax)
    
    for idCurso in range(cantCursos):
        for diaSemana in range(diasSemana):
            if(horarioEntrada[idCurso][diaSemana][0] >= 0 and maxBloquesDia[idCurso][diaSemana] >= 0):
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
                finales.finalIncorrecto(13)

def elegirCursoBloque(dia, numBloque, cantCursos, cursos):
    for idCurso in range(cantCursos):
        if(verificaciones.checkearDisponibilidad(cursos[idCurso].Disponibilidad, dia, numBloque, idCurso, 0)): 
            return idCurso
    return -1

def elegirCurso():
    for numCurso in range(cantCursos):
        if(cantBloquesOcupados[numCurso] < cantBloquesReal[numCurso]):
            return numCurso
    return -1

def cambiarDatos(dbq):
    cursos[dbq.numCurso].Disponibilidad[dbq.dia][dbq.numBloque] = 0
    profesores[dbq.idProfesor].Disponibilidad[dbq.dia][dbq.numBloque] = 0
    aulas[dbq.idAula].Disponibilidad[dbq.dia][dbq.numBloque] = 0
    materias[dbq.idMateria].NumBloques[dbq.numCurso] = materias[dbq.idMateria].NumBloques[dbq.numCurso] - 1
    bloquesxDia[dbq.numCurso][dbq.dia][dbq.numBloque] = -3
    cantBloquesOcupados[dbq.numCurso] = cantBloquesOcupados[dbq.numCurso] + 1
    bloquesDiaReal[dbq.numCurso][dbq.dia] = bloquesDiaReal[dbq.numCurso][dbq.dia] + 1

def guardarBloque(dbq):
    bloquesAux.append([dbq.dia, dbq.numBloque, dbq.numCurso, dbq.idProfesor, dbq.idAula, dbq.idMateria])
    cambiosBDD.anotarBloque(dbq, cursos, profesores, aulas, materias)

def avisarConsola(idBloque):
    if(idBloque == -1):
        idBloque = len(bloquesAux)
    print("Bloque completo: " + str(bloquesAux[idBloque]))

def nuevoBloque(datosBloque, idBloque):
    guardarBloque(datosBloque)
    cambiarDatos(datosBloque)
    avisarConsola(idBloque)

def forzarBloque(dia, numBloque, numCurso, idProfesor, idAula, idMateria):
    if(cursos[numCurso][dia][numBloque] == 0 or profesores[idProfesor][dia][numBloque] == 0 or aulas[idAula][dia][numBloque] == 0 or materias[numCurso][dia][idMateria].numBloques == 0):
        finales.finalIncorrecto(8)
    else:
        datosBloque = DatosBloque(dia, numBloque, numCurso, idProfesor, idAula, materias[idMateria])
        nuevoBloque(datosBloque, -1)

def llenarDatosBloque(numCurso, dia, numBloque):
    idMateria = eleccionDatos.elegirMateria(numCurso, cantMaterias, materias);
    if idMateria == -1: return -1
    idProfesor = eleccionDatos.elegirProfesor(dia, numBloque, cantProfesores, profesores)
    if idProfesor == -1: return -1
    idAula = eleccionDatos.elegirAula(dia, numBloque, cantAulas, aulas)
    if idProfesor == -1: return -1
    return (DatosBloque(dia, numBloque, numCurso, idProfesor, idAula, idMateria))

def verificacionFinal(todosContados):
    if(todosContados):
        for numCurso in range(cantCursos):
            for numBloque in range(len(bloquesxDia[numCurso])):
                if(bloquesxDia[numCurso][numBloque] == 0):
                    bloquesxDia[numCurso][numBloque] = -4 #ARREGLAR
        print(bloquesxDia)
        print(bloquesDiaReal)
        finales.finalCorrecto("Se llenaron todos los bloques")
    print(bloquesxDia)
    print("")
    finales.finalIncorrecto(4)

def stringToArray(string):
    array = []
    for id in range(len(string)):
        array.append(int(string[id]))
    return array

def cambiarDisponibilidadCurso(array, cant, cantBloques):
    algoMas = []
    for numArray in range(cant):
        if(len(array[numArray].Disponibilidad) != cantBloques[numArray]):
            array[numArray].Disponibilidad = array[numArray].Disponibilidad[::-1]
            for i in range(cantBloquesMax - len(array[numArray].Disponibilidad)):
                array[numArray].Disponibilidad += '0'
            array[numArray].Disponibilidad = array[numArray].Disponibilidad[::-1]
        array[numArray].Disponibilidad = stringToArray(array[numArray].Disponibilidad)
        algoMas = []
        for i in range(int(len(array[numArray].Disponibilidad)/maxCantBloques)):
            aux = []
            for a in range(maxCantBloques):
                aux.append(array[numArray].Disponibilidad[i*maxCantBloques+a])
            algoMas.append(aux)
        array[numArray].Disponibilidad = algoMas

def cambiarDisponibilidades(array, cant):
    algoMas = []
    for numArray in range(cant):
        if(len(array[numArray].Disponibilidad) != cantBloquesMax):
            array[numArray].Disponibilidad = array[numArray].Disponibilidad[::-1]
            for i in range(cantBloquesMax - len(array[numArray].Disponibilidad)):
                array[numArray].Disponibilidad += '0'
            array[numArray].Disponibilidad = array[numArray].Disponibilidad[::-1]
        array[numArray].Disponibilidad = stringToArray(array[numArray].Disponibilidad)
        algoMas = []
        for i in range(int(len(array[numArray].Disponibilidad)/maxCantBloques)):
            aux = []
            for a in range(maxCantBloques):
                aux.append(array[numArray].Disponibilidad[i*maxCantBloques+a])
            algoMas.append(aux)
        array[numArray].Disponibilidad = algoMas

def ajustarMaterias():
    for numMateria in range(cantMaterias):
        if(len(materias[numMateria].NumBloques) != cantCursos):
            materias[numMateria].NumBloques = materias[numMateria].NumBloques[::-1]
            for i in range(cantCursos - len(materias[numMateria].NumBloques)):
                materias[numMateria].NumBloques += '0'
            materias[numMateria].NumBloques = materias[numMateria].NumBloques[::-1]
            materias[numMateria].NumBloques = stringToArray(materias[numMateria].NumBloques)
        else:
            materias[numMateria].NumBloques = stringToArray(materias[numMateria].NumBloques)

def pasarAObjetos():
    cambiarDisponibilidadCurso(cursos, cantCursos, cantBloques)
    cambiarDisponibilidades(profesores, cantProfesores)
    cambiarDisponibilidades(aulas, cantAulas)

def llenarBloque(vuelta):
    for numCurso in range(cantCursos):
        if(cantBloquesOcupados[numCurso] < cantBloquesReal[numCurso]):
            for preNumBloque in range(cantBloques[numCurso]):
                dia = preNumBloque%maxCantBloques
                numBloque = math.trunc(preNumBloque/maxCantBloques)
                datosBloque = llenarDatosBloque(numCurso, dia, numBloque)
                if(datosBloque != -1):
                    if(bloquesxDia[numCurso][dia][numBloque] >= 0):
                        nuevoBloque(datosBloque, vuelta)
                        return 1
    todosContados = True
    for i in range(cantCursos):
        if(cantBloquesOcupados[i] != cantBloquesReal[i]):
            todosContados = False
            print(bloquesxDia)
            print(materias)
            finales.finalIncorrecto(4)
    if(todosContados == True):
        verificacionFinal(todosContados)

def preVerificacionesManuales():
    return -1
    exit()

def postVerificacionesManuales():
    return -1
    exit()

def preInicio():
    preVerificacionesManuales()
    cambiosBDD.vaciarBloques(False)
    fillEverything(aulas, profesores, cursos, bloques, dias, anios, orientaciones, materias, profesorxMaterias)
    declaracionesIniciales()
    condicionales.condicionalesIniciales(cantCursos, cantAulas, cantProfesores, cantBloques, diasSemana, maxBloquesDia, minBloquesDia, horarioEntrada)
    pasarAObjetos()
    ajustarMaterias()
    postVerificacionesManuales()

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
    finales.finalCorrecto("Llego al final. Continuar para borrar datos")
    exit()

llenarBloques()

cambiosBDD.vaciarBloques(False)
cambiosBDD.ponerComoDefault(1111111111111111111111111, True, True) # Devuelve los valores de las disponibilidades al default, (0 o 1 dependiendo de lo enviado)