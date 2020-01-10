propozitie = input ()
cuvinte = propozitie.split()

d = {}
for cuvant in cuvinte:
    if cuvant not in d:
        d[cuvant] = 1
    else: d[cuvant] += 1

for cheie in d:
    print(cheie, ' ', d[cheie])