#x, n, p, m = input().split()
#x, n, p, m = int(x), int(n), int(p), int(m)

x = int(input('x = '))      # lungimea initiala a sariturii
n = int(input('n = '))      # numar sarituri de lungime x
p = int(input('p = '))      # procent
m = int(input('m = '))      # numar total de sarituri

d = 0                       # distanta totala parcursa de greiere

for i in range(m):
    if i == n:
        x = int(x - ((p / 100) * x))
    d += x

print(d, 'cm')

