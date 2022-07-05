class Profesor:
    def __init__(self, _id, _nombre, _apellido, _disponibilidad):
        self.id = _id
        self.nombre = _nombre
        self.apellido = _apellido
        self.disponibilidad = _disponibilidad

class Curso:
    def __init__(self, _id, _nombre, _bloquesOcupados, _disponibilidad, _idOrientacion, idAnio):
        self.id = _id
        self.nombre = _nombre
        self.bloquesOcupados = _bloquesOcupados
        self.disponibilidad = _disponibilidad
        self.idOrientacion = _idOrientacion
        self.idAnio = idAnio

class Aula:
    def __init__(self, _id, _nombre, _disponibilidad):
        self.id = _id
        self.nombre = _nombre
        self.disponibilidad = _disponibilidad

class Bloque:
    def __init__(self, _id, _idProfesor, _idAula, _idCurso):
        self.id = _id
        self.idProfesor = _idProfesor
        self.idAula = _idAula
        self.idCurso = _idCurso

class Orientacion:
    def __init__(self, _id, _nombre):
        self.id = _id
        self.nombre = _nombre

class Anio:
    def __init__(self, _id, _nombre, _cargaHoraria):
        self.id = _id
        self.nombre = _nombre
        self.cargaHoraria = _cargaHoraria

class ProfesorxMateria:
    def __init__(self, _idProfesor, _idMateria):
        self.idProfesor = _idProfesor
        self.idMateria = _idMateria

class Materia:
    def __init__(self, _id, _nombre, _prioridad):
        self.id = _id
        self.nombre = _nombre
        self.prioridad = _prioridad