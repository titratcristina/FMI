f = open('cuburi.txt')
n = int(f.readline())
l = []
for i in range(n):
	x = f.readline().split()
	l.append((int(x[0]), x[1]))
l.sort(reverse = True, key = lambda x: x[0])
g = open('turn.txt', 'w')
x = l[0]
g.write('{} {}\n'.format(x[0], x[1]))
sum = x[0]
for y in l:
	if y[0] != x[0] and y[1] != x[1]:
		x = y
		g.write('{} {}\n'.format(x[0], x[1]))
		sum = x[0]
g.write('Inaltimea totala: {}'.format(sum))