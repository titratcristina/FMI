a = int(input("a = "))
b = int(input("b = "))
c = int(input("c = "))

delta = b ** 2 - 4 * a * c

if delta < 0:
    print("Ecuatia nu are radacini reale")
elif delta == 0:
    x = int( -b / 2 * a )
    print("x1 = x2 = ", x)
else:
    x1 = ( -b - delta ** 0.5 ) / 2 * a
    x2 = ( -b + delta ** 0.5 ) / 2 * a
    print("x1 = ", x1, "\nx2 = ", x2)

