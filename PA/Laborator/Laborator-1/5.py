n = int(input("n = "))
max1, max2 = 0, 0

for i in range(n):
   elem = int(input())
   if elem > max1:
       max2 = max1
       max1 = elem
   elif elem != max1 and elem > max2:
       max2 = elem

if max2:
   print(max1, max2)
else:
   print("Imposibil")