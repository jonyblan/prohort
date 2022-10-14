class Error:
    def __init__(self, _id, _mensaje):
        self.id = _id
        self.mensaje = _mensaje

error_msgs = {
    1: "Mas cantidad de cursos que de aulas",
    2: "Mas cantidad de cursos que de profesores",
    3: "Mas Cursos que bloques",
    4: "No hay suficientes soluciones",
    5: "Error en checkear disponibilidad",
    6: "Alguna disponibilidad no es 0 ni 1",
    7: "No terminado de codear",
    8: "No se puede forzar el bloque deseado",
    9: "No hay suficientes bloques en un dia",
    10: "La minima cantidad de bloques es mayor a la maxima",
    11: "No aclara si hay clases ese dia",
    12: "No hay posibilidad de un horario de entrada",
    13: "Interferencia entre max/minBloquesDia y horarioEntrada",
    14: "Se debe mandar 0 o un numero exacto por el default",
    15: "No existe ese error"
}

def devolverMensaje(id):
    if id > error_msgs or id < 1: return error_msgs[15]
    return error_msgs[id]