a = [[[1, 1, 1], [0, 1, 1], [0, 0, 0]], [[1, 1, 0], [0, 0, 0], [0, 1, 1]], [[1, 1, 0], [0, 1, 1], [0, 0, 1]], [[1, 1, 0], [0, 1, 0], [0, 0, 0]], [[1, 0, 0], [0, 1, 1], [0, 1, 0]]]

def error(code):
    print("ERROR CODE " + str(code))
    exit()

def checkearInput():
    for i in range(len(a)):
        for b in range(len(a[0])):
            for c in range(len(a[0][0])):
                if(a[i][b][c] != 1 and a[i][b][c] != 0):
                    error(5)

def checkearDisponibilidad(disponibilidad, numBloque, numArray, idLlamador): 
    if(disponibilidad[numBloque] == 1 or disponibilidad[numBloque] == "1"):
        return True
    elif(disponibilidad[numBloque] == 0 or disponibilidad[numBloque] == "0"):
        return False
    else:
        error(5)

checkearInput()
cantBloques = 3

def llenarBloque(vuelta):
    for numBloque in range(cantBloques+1):
        f = 0
        for f in range(len(a)):
            g = 0
            for g in range(len(a[0])):
                h = 0
                for h in range(len(a[0][0])):
                    error(7)

llenarBloque(1)