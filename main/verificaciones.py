from errores import devolverMensaje

def checkearDisponibilidad(disponibilidad, dia, numBloque, numArray, idLlamador):
    if not isinstance(disponibilidad[dia][numBloque], int):
        disponibilidad[dia][numBloque] = int(disponibilidad[dia][numBloque])
        
    if(disponibilidad[dia][numBloque] == 1):
        return True
    elif(disponibilidad[dia][numBloque] == 0):
        return False
    else: 
        devolverMensaje(3)