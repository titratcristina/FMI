L1 = int(input("L1 = "))
L2 = int(input("L2 = "))

arie = L1 * L2

# CMMDC
while L1 != L2:
    if L1 > L2:
        L1 -= L2
    else:
        L2 -= L1

placi = int(arie / (L1 * L2))

print(placi, 'placi cu dimensiunea', L1, 'cm')