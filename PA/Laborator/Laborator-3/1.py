v = input().split()

max1 = 0
max2 = 0

for nr in v:
    nr = int(nr)
    if nr > max1:
        max2 = max1
        max1 = nr
    else:
        if nr != max1 and nr > max2:
            max2 = nr

print(max1, '', max2)