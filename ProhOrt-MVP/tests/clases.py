class Profesor:
    def __init__(self, _id, _nombre, _apellido, _disponibilidad, _minBloquesxDia, _maxBloquesxDia):
        self.id = _id
        self.nombre = _nombre
        self.apellido = _apellido
        self.disponibilidad = _disponibilidad
        self.minBloquesxDia = _minBloquesxDia
        self.maxBloquesxDia = _maxBloquesxDia

profesores = []
profesores.append([Profesor(0, "np0", "ap0", [0, 0, 0]), Profesor(1, "np1", "ap1", [0, 5, 0]), Profesor(2, "np2", "ap2", [0, 0, 0])])
#print(profesores[0][1].disponibilidad[1])

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

cursos = []
cursos.append([Curso(0, "5IA", 0, [1, 0, 1], 0, 12), Curso(1, "5IB", 0, [1, 5, 1], 0, 12), Curso(2, "5IC", 0, [1, 1, 1], 0, 12)])

class Aula:
    def __init__(self, _id, _nombre, _disponibilidad):
        self.id = _id
        self.nombre = _nombre
        self.disponibilidad = _disponibilidad

aulas = []
aulas.append([Aula(0, "na0", [1, 1, 1]), Aula(0, "na0", [1, 5, 1]), Aula(0, "na0", [1, 1, 1])])

class Bloque:
    def __init__(self, _id, _idProfesor, _idAula, _idCurso):
        self.id = _id
        self.idProfesor = _idProfesor
        self.idAula = _idAula
        self.idCurso = _idCurso

bloques = []
bloques.append([Bloque(0, 0, 0, 0), Bloque(1, 0, 5, 0), Bloque(2, 0, 0, 0)])

class Orientacion:
    def __init__(self, _id, _nombre):
        self.id = _id
        self.nombre = _nombre

orientaciones = []
Orientacion(0, "no0"), Orientacion(1, "no1"), Orientacion(2, "no2")

class Anio:
    def __init__(self, _id, _nombre, _cargaHoraria):
        self.id = _id
        self.nombre = _nombre
        self.cargaHoraria = _cargaHoraria

anios = []
anios.append([Anio(0, "na0", 0), Anio(1, "na1", 1), Anio(2, "na2", 2)])

class ProfesorxMateria:
    def __init__(self, _idProfesor, _idMateria):
        self.idProfesor = _idProfesor
        self.idMateria = _idMateria

profesorxmaterias = []
profesorxmaterias.append([ProfesorxMateria(0, 0), ProfesorxMateria(1, 1), ProfesorxMateria(2, 2)])

class Materia:
    def __init__(self, _id, _nombre, _prioridad):
        self.id = _id
        self.nombre = _nombre
        self.prioridad = _prioridad

materias = []
materias.append([Materia(0, "nm0", 0), Materia(1, "nm1", -1), Materia(2, "nm2", -2)])