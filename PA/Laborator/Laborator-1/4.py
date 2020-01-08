n = int(input())
s = input().split(',')
d = [0.0] * n
maxim = 0

for i in range(n):
    d[i] = float(s[i])
    if i > 0:
        dif = d[i] - d[i-1]
        if dif > maxim:
            maxim = dif

print(round(maxim,2))