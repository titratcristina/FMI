f = open('spectacole.txt')
l = []
x = f.readline()
while x:
	x = x.split('-')
	a = x[0]
	x = x[1].split(' ', 1)
	b = x[0]
	c = x[1][:len(x[1]) - 1]
	l.append((a, b, c))
	x = f.readline()
l.sort(key = lambda x: x[1])
g = open('programare.txt', 'w')
x = l[0]
g.write('{}-{} {}\n'.format(x[0], x[1], x[2]))
for y in l:
	if y[0] > x[1]:
		x = y
		g.write('{}-{} {}\n'.format(x[0], x[1], x[2]))