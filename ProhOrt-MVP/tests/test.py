class Curso:
    def __init__(self, _id, _nombre, _bloquesOcupados, _disponibilidad, _idOrientacion, idAnio):
        self.id = _id
        self.nombre = _nombre
        self.bloquesOcupados = _bloquesOcupados
        self.disponibilidad = _disponibilidad
        self.idOrientacion = _idOrientacion
        self.idAnio = idAnio

cursos = []
curso1 = Curso(0, "5IA", 0, [1, 0, 1], 0, 12)
curso2 = Curso(1, "5IB", 0, [1, 1, 1], 0, 12)
curso3 = Curso(2, "5IC", 0, [1, 1, 1], 0, 12)
cursos.append([curso1, curso2, curso3])

# El orden de estos objetos es [[disponibilidadBloque1, disponibilidadBloque2, disponibilidadBloque3][same]]. Cada uno es un curso
curso  = [[1, 1, 1], [1, 1, 1], [1, 1, 1]]
profesor  = [[1, 1, 1], [1, 1, 1], [1, 1, 1]]
aula  = [[1, 1, 1], [1, 1, 1], [1, 1, 1]]
d  = [[1, 1, 1], [0, 1, 0], [0, 0, 0]]
e  = [[1, 0, 0], [0, 1, 1], [0, 1, 0]]
# el orden de los bloques es [[(numBloque, (id)curso, (id)profesor, (id)aula, (id)d, (id)e)][same]]. Cada uno es un bloque
bloques = []
cantBloques = 2

def error(code):
    print("ERROR CODE " + str(code))
    exit()

def checkearDisponibilidad(disponibilidad, numBloque, numArray, idLlamador):
    if(disponibilidad[numBloque] == 1 or disponibilidad[numBloque] == "1"):
        return True
    elif(disponibilidad[numBloque] == 0 or disponibilidad[numBloque] == "0"):
        return False

def forzarBloque(numBloque, idCurso, idProfesor, idAula, idD, idE):
    if(curso[idCurso][numBloque] == 0 or profesor[idProfesor][numBloque] == 0 or aula[idAula][numBloque] == 0 or d[idD][numBloque] == 0 or e[idE][numBloque] == 0):
        error(8)
    else:
        bloques.append([numBloque, idCurso, idProfesor, idAula, idD, idE])
        curso[idCurso][numBloque] = 0
        profesor[idProfesor][numBloque] = 0
        aula[idAula][numBloque] = 0
        d[idD][numBloque] = 0
        e[idE][numBloque] = 0

def llenarBloque(vuelta):
    for numBloque in range(cantBloques+1):
        idCurso = 0
        for idCurso in range(len(curso)):
            if(checkearDisponibilidad(curso[idCurso], numBloque, idCurso, 0)):
                idProfesor = 0
                for idProfesor in range(len(profesor)):
                    if(checkearDisponibilidad(profesor[idProfesor], numBloque, idProfesor, 1)):
                        idAula = 0
                        for idAula in range(len(aula)):
                            if(checkearDisponibilidad(aula[idAula], numBloque, idAula, 2)):
                                idD = 0
                                for idD in range(len(d)):
                                    if(checkearDisponibilidad(d[idD], numBloque, idD, 3)):
                                        idE = 0
                                        for idE in range(len(e)):
                                            if(checkearDisponibilidad(e[idE], numBloque, idE, 4)):
                                                curso[idCurso][numBloque] = 0
                                                profesor[idProfesor][numBloque] = 0
                                                aula[idAula][numBloque] = 0
                                                d[idD][numBloque] = 0
                                                e[idE][numBloque] = 0
                                                bloques.append([numBloque, idCurso, idProfesor, idAula, idD, idE])
                                                print("Bloque completo: " + str(bloques[vuelta]))
                                                return 1
    error(4)

def llenarBloques():
    vueltas = 1
    for i in range(vueltas):
        llenarBloque(i)
    print("Llego al final. Continuar para borrar datos")
    print("")

llenarBloques()