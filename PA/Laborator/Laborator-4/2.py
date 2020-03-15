from math import pi

def lungime_arie_cerc(r):
    l = 2 * round(pi,2) * r
    a = round(pi,2) * r ** 2
    return l, a

r = int(input())
print(lungime_arie_cerc(r))