def afisare_timpi_servire(l):
	sum = 0
	s = 0
	for x in l:
		sum += x[1]
		s += sum
		print(x[0], x[1], sum)
	return s

f = open('tis.txt')
y = f.readline().split()
l =[]
nr = 1
for x in y:
	l.append((nr, int(x)))
	nr += 1
s = afisare_timpi_servire(l)
nr -= 1
print(round(s/nr, 2))
print('--------')
l.sort(key = lambda x: x[1])
s = afisare_timpi_servire(l)
print(round(s/nr, 2))