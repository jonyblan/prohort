a  = [[1, 0, 1], [1, 0, 1], [1, 0, 1]]
b  = [[1, 0, 1], [1, 0, 1], [1, 0, 1]]
c  = [[1, 0, 1], [1, 0, 1], [1, 0, 1]]
d  = [[1, 0, 1], [1, 0, 1], [1, 0, 1]]
e  = [[1, 0, 1], [1, 0, 1], [1, 0, 1]]
bloques = []
cantBloques = 2

def checkearDisponibilidad(disponibilidad, numBloque, numArray, idLlamador):
    if(disponibilidad[numArray][numBloque] == 1 or disponibilidad[numArray][numBloque] == "1"):
        return True
    else:
        return False

for numBloque in range(cantBloques+1):
    f = 0
    for f in range(len(a)):
        if(checkearDisponibilidad(a, numBloque, f, 0)):
            g = 0
            for g in range(len(b)):
                if(checkearDisponibilidad(b, numBloque, g, 1)):
                    h = 0
                    for h in range(len(c)):
                        if(checkearDisponibilidad(c, numBloque, h, 2)):
                            j = 0
                            for j in range(len(d)):
                                if(checkearDisponibilidad(d, numBloque, j, 3)):
                                    k = 0
                                    for k in range(len(e)):
                                        if(checkearDisponibilidad(e, numBloque, k, 4)):
                                            exit()