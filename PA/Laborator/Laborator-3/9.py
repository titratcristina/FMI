f = open('input.txt')
s = f.read()
l = []
for x in s.split('\\n '):
    y = x.split(':', 1)[0]
    n = x.count(y + ' ')
    m = x.count('~')
    nr = m + n
    l.append((y, nr))
print(l)