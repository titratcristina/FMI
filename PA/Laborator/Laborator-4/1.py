# a)
# from math import sqrt
#
# def ipotenuza(a,b):
#     c = sqrt(a ** 2 + b ** 2)
#     return c
#
# print(ipotenuza(3,4))

# b)
from math import sqrt
from math import floor

def ipotenuza(a,b):
    c = sqrt(a ** 2 + b ** 2)
    return c

b = int(input())
g = open('triplete_pitagoreice.txt', 'w')
for a in range(1, b + 1):
    c = ipotenuza(a, b)
    if c - floor(c) == 0.0:
        t = (a,b,int(c))
        g.write(str(t))
        g.write("\n")