# propozitie = "Ana are mere Ana are Ana"
propozitie = input()
cuvinte = propozitie.split()                    # se stocheaza intr-un vector cuvintele din propozitie
numarare = {}                                   # declar un dictionar gol

for cuvant in cuvinte:                          # cuvant = cuvinte[i]
    if cuvant not in numarare:                  # daca cuvinte[i] nu sunt in numarare
        numarare[cuvant] = 1                    # numarare[cuvinte[i]] = 0
    else: numarare[cuvant] += 1                 # num[cuv[i]] = num[cuv[i]] + 1

print(numarare)

cuvantDes = max(zip(numarare.values(), numarare.keys()))
cuvantRar = min(zip(numarare.values(), numarare.keys()))

print(cuvantDes)
print(cuvantRar)


