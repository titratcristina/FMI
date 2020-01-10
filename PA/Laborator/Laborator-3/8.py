f = open('inventar.txt')
d = {}
x = f.readline()

while x:
    y = x.split()
    d[y[0]] = {*y[1:]}
    x = f.readline()

# intersectie
int = d[y[0]]
for x in d:
    int = int.intersection(d[x])
for x in int:
    print(x, end=" ")
print()

# reuniune
reun = d[y[0]]
for x in d:
    reun = reun.union(d[x])
for x in reun:
    print(x, end=" ")
print()

# diferenta
for x in d:
    dif = d[x]
    for y in d:
        if y != x:
            dif = dif.difference(d[y])
    print(x, ": ", end="")
    for y in dif:
        print(y, end=" ")
    print()
