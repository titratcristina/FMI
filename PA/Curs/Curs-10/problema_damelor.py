def printSol(tabla):
    # afisarea tablei
    for i in range(len(tabla)):
        print(tabla[i])


def check(tabla,row,col):
    # verific sa nu mai fie o dama pe acelasi rand
    for i in range(col):
        if tabla[row][i] == 1:
            return False
    #verific sa nu mai fie o dama diagonala in stanga-sus
    i = row - 1; j = col - 1
    while i >= 0 and j >= 0:
        if tabla[i][j] == 1:
            return False
        i -= 1; j -= 1
    # verific sa nu mai fie o dama diagonala in stanga-jos
    i = row + 1; j = col - 1
    while i < len(tabla) and j >= 0:
        if tabla[i][j] == 1:
            return False
        i -= -1; j -= 1
    return True

def bkt(tabla,col):
    # daca col==len(tabla) inseamna ca am pus toate damele
    if col == len(tabla): return True
    for i in range (len(tabla)):
        if check(tabla,i,col):
            tabla[i][col] = 1
            # adaug cate un element pe fiecare coloana
            if bkt(tabla, col + 1):
                return True
        tabla[i][col] = 0
    return False

n = 4
rand = [0] * n
tabla = []
for i in range(n):
    tabla.append(rand.copy())
if bkt(tabla, 0):
    printSol(tabla)


