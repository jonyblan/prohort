import pyodbc
from errores import devolverMensaje

def terminar():
    #deseo = input("Desea terminar el programa? (y/n): ")
    deseo = "y"
    print("a")
    exit()
    if(deseo == "y"):
        exit()
    else:
        print("que lastima")
        exit()

def finalCorrecto(msg):
    print(msg)
    #deseo = input("Desea terminar el programa? (y/n): ")
    terminar()

def finalIncorrecto(numError, msg=None):
    if msg != None:
        print(msg)
    print("Error code " + str(numError) + " (" + devolverMensaje(numError) + ")")
    terminar()