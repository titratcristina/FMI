p = input()
rime = {}

for cuv in p.split():
    sufix = cuv[len(cuv)-3 : len(cuv)-1]
    if sufix in rime:
        rime[sufix].append(cuv)
    else:
        rime[sufix] = [cuv]

final = {}

for cheie in rime:
    if len(rime[cheie]) >= 2:
        final[cheie] = rime[cheie]

for cheie in final:
    print(final[cheie])