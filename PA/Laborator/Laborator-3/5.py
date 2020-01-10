prop = input().split()
cuv = input()
d1 = {}

for litera in cuv:
    d1[litera] = 1

for cuvant in prop:
    d2 = {}
    if cuvant[len(cuvant) - 1] == ',' or cuvant[len(cuvant) - 1] == '.':
        cuvant = cuvant[0 : len(cuvant) - 1]    # se elimina virgula sau punctul
    for c in cuvant:
            d2[c] = 1
    if d2.keys() == d1.keys():
        print(cuvant)