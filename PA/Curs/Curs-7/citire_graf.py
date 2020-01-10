f = open("intrare.txt")
n = int(f.readline())
A = [None] * (n+1)
L = [[]]
for i in range(n):
    A[i+1] = [0] * (n+1)
    L.append([])
for line in f:
    l = line.split()
    i = int(l[0])
    j = int(l[1])
    A[i][j] = A[j][i] = 1
    L[i].append(j)
    L[j].append(i)
"""
for i in range(n):
    print(A[i+1][1:])
"""
for i in range(n):
    print(L[i+1])
