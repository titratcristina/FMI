s = input()

# lista
l = []
nr = 0
while s != '-1':
    nr += 1
    p, n = s.split(' ', 1)
    n = n.split('\n')[0]
    p = int(p)
    l.append((p, n, nr))
    s = input()
print('lista ', l)

# set
se = {l[0][0]}
for x in l:
    if x[0] not in se:
        se.add(x[0])
print('set ', se)

# dictionar
d = {}
for x in l:
    if x[0] in d:
        d[x[0]].append((x[1], x[2]))
    else:
        d[x[0]] = [(x[1], x[2])]
po = sorted(d, reverse=True)
print('dictionar')
for x in po:
    print(str(x) + ': ', d[x])