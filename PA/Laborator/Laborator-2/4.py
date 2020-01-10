sir1 = input()
sir2 = input()

for caracter in sir1:
    sir2 = sir2.replace(caracter, '', 1)

if sir2:
    print("Nu sunt anagrame")
else:
    print("Sunt anagrame")