emptySpaces = []

def printSol(tabla):
    # afisarea tablei
    for i in range(9):
        print(tabla[i])

def readEmptySpace(tabla):
    # caut toate campurile libere si le retin in un vector de pozitii (perechi)
    for i in range(9):
        for j in range(9):
            if tabla[i][j] == 0:
                emptySpaces.append((i, j))

def checkRowCol(tabla, row, col, val):
    # verific ca val sa nu mai fie pe linie sau coloana
    for i in range(row):
        if tabla[i][col] == val: return False
    for j in range(col):
        if tabla[row][j] == val: return False
    return True

def checkPatrat(tabla, row, col, val):
    # verific apartenenta la patratul de 3x3 de care apartine campul (row,co;)
    r = row - row % 3;
    c = col - col % 3
    # (r,c) vor fi coordonatele punctului de stanga-sus al patratului 3x3 care contine pozitia (row,col)
    for i in range(r, r + 3):
        for j in range(c, c + 3):
            if tabla[i][j] == val: return False
    return True

def checkAll(tabla, row, col, val):
    return checkRowCol(tabla, row, col, val) and checkPatrat(tabla, row, col, val)

def bkt(tabla, k):
    if k == len(emptySpaces): return True
    row, col = emptySpaces[k]
    for val in range(1, 10):
        if checkAll(tabla, row, col, val):
            tabla[row][col] = val
            if bkt(tabla, k + 1):
                return True
            tabla[row][col] = 0
    return False

tabla = [
    [2, 4, 3, 0, 2, 0, 6, 0, 0],
    [9, 0, 0, 3, 0, 5, 8, 0, 1],
    [0, 0, 1, 8, 0, 6, 4, 0, 0],
    [0, 0, 8, 1, 0, 2, 9, 0, 0],
    [7, 2, 0, 5, 0, 0, 1, 0, 8],
    [0, 0, 6, 7, 0, 8, 2, 0, 0],
    [0, 0, 2, 6, 0, 9, 5, 0, 0],
    [8, 0, 0, 2, 0, 3, 0, 6, 9],
    [0, 0, 5, 0, 1, 0, 3, 8, 2]
]
readEmptySpace(tabla)
if bkt(tabla, 0):
    printSol(tabla)
else:
    print("Nu se poate")


