#nume_fisier = str(input())
#fisier = open(nume_fisier)
fisier = open('cheltuieli.txt')
cuvinte = fisier.read().split()
nr = []
sum = 0
for cuv in cuvinte:
    if cuv.isnumeric():
        nr.append(int(cuv))
    elif len(cuv.split(".")) == 2 and cuv.split(".")[0].isnumeric() and cuv.split(".")[1].isnumeric():
        nr.append(float(cuv))

for i in range(0, len(nr), 2):
    sum += nr[i] * nr[i+1]
print(sum)