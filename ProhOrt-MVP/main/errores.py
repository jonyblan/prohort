class Error:
    def __init__(self, _id, _mensaje):
        self.id = _id
        self.mensaje = _mensaje

def devolverMensaje(id):

    listaErrores = []
    listaErrores.append(Error((len(listaErrores)+1), "Mas cantidad de cursos que de aulas"))
    listaErrores.append(Error((len(listaErrores)+1), "Mas cantidad de cursos que de profesores"))
    listaErrores.append(Error((len(listaErrores)+1), "Mas Cursos que bloques"))
    listaErrores.append(Error((len(listaErrores)+1), "No hay suficientes soluciones"))
    listaErrores.append(Error((len(listaErrores)+1), "Error en checkear disponibilidad"))
    listaErrores.append(Error((len(listaErrores)+1), "Alguna disponibilidad no es 0 ni 1"))
    listaErrores.append(Error((len(listaErrores)+1), "No terminado de codear"))
    listaErrores.append(Error((len(listaErrores)+1), "No se puede forzar el bloque deseado"))
    listaErrores.append(Error((len(listaErrores)+1), "No hay suficientes bloques en un dia"))
    listaErrores.append(Error((len(listaErrores)+1), "La minima cantidad de bloques es mayor a la maxima"))
    listaErrores.append(Error((len(listaErrores)+1), "No aclara si hay clases ese dia"))
    listaErrores.append(Error((len(listaErrores)+1), "No hay posibilidad de un horario de entrada"))
    listaErrores.append(Error((len(listaErrores)+1), "Interferencia entre max/minBloquesDia y horarioEntrada"))
    listaErrores.append(Error((len(listaErrores)+1), "Se debe mandar 0 o un numero exacto por el default"))
    
    for i in range (len(listaErrores)):
        if(listaErrores[i].id == id):
            return listaErrores[i].mensaje
    return("No existe este error")