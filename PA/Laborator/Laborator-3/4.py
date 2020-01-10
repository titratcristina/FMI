d1 = {
    "a": 1,
    "b": 2,
    "c": 4
}

d2 = {
    "a": 4,
    "d": 7
}

for cheie in d1:
    if cheie in d2:
        d2[cheie] += d1[cheie]
    else:
        d2[cheie] = d1[cheie]

print(d2)