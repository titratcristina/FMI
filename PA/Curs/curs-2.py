### Curs 2 - PA ###

# Tipuri de date de baza: int, float, complex, string

a = 13              # intreg
b = 15.75           # flaot
c = 16+25j          # nr. complex
s = "Ana are mere"  # string
ok = True           # boolen (True sau False)

print("Tipuri de date de baza")

print(type(a), a)
print(type(b), b)
print(type(c), c)
print(type(ok), ok)
print(type(s), s)

print("\n-------------------\n")

print("Transformari dintr-o baza in alta")

binar = "1000110"   # un string reprezentand un numar in binar
hexa = "2f1"        # un string reprezentand un numar in baza 16

a = int(binar, 2)   # am ales baza 2, merge in orice baza
print(binar + " scris din baza 2 in baza 10 este", a)

a = int(hexa, 16)
print(hexa + " scris din baza 16 in baza 10 este", a)

print("\n-------------------\n")

# OPERATORI ARITMETICI
# '+'     adunare
# '-'     scadere
# '*'     inmultire
# '**'    ridicare la putere
# '/'     impartire cu virgula
# '//'    div
# '%'     mod

print("Operatori aritmetici")
print("2+3 = ", 2+3)
print("2-3 = ", 2-3)
print("2*3 = ", 2*3)
print("2^2 = ", 2**3)
print("19/4 = ", 19/4)
print("19 div 4 = ", 19//4)
print("19 mod 4 = ", 19%4)

print("\n-------------------\n")

# OPERATORI LOGICI
# and
# or

print("Operatori logici")
t = True
f = False
print ("T and F is ", t and f)
print ("T and T is ", t and t)
print ("F and F is ", f and f)
print ("T or F is ", t or f)
print ("T or T is ", t or t)
print ("F or F is ", f or f)

# OPERATORI pe BITI
# & - and
# | - or
# ^ - xor
# actioneaza la fel ca in C/C++

print("\n-------------------\n")

# '+' - concatenare pe stringuri 

print("Concatenare:")
s1 = "un string"
s2 = "alt string"
s3 = s1 + " concatenat cu " + s2
print(s3)

print("\n-------------------\n")

# Instructiunea IF 

luna = int(input("Introduceti un numar de la 1 la 12, simbolizand luna dintr-un an: "))

if luna == 12 or (luna > 0 and luna < 3):
    print("Este iarna")
elif luna <= 5:
    print("Este primavara")
elif luna <= 8:
    print("Este vara")
elif luna < 12:
    print("Este toamna")
else:
    print("Ati introdus un numar gresit")
    
print("\n-------------------\n")
    
#Instructiunea IF/ELIF/ELSE 

x = int(input("introduceti un numar: "))

if x < 0:         # observam ca daca valoarea introdusa este negativa
    x = 0         # variabila este reinitializata cu 0
    print("valoarea introdusa era negativa si a fost reinitializata cu 0")
elif x == 0:      # in ciuda faptului ca variabila poate fi 0 in acest moment, ne aflam pe ramura else if
    print("valoarea introdusa este nula") # mesajul este afisat doar daca valoarea citita era 0 initial
else: 
    print("valoarea introdusa este pozitiva")

print("x =", x)
print("\n-------------------\n")

# Instructiunea WHILE

n = int(input("introduceti un numar: "))
x = n
sum = 0

while x != 0:
    sum += x % 10   # echivalent cu x = x % 10 ~ x = x mod 10
    x //= 10        # echivalent cu x = x // 10 ~ x = x div 10
    
print("suma cifrelor lui", n, "este", sum)

print("\n-------------------\n")

# Instructiunea for x in range()

for i in range(10):         # i va lua valorile 0,1,2,...,9
    print(i, end = " ")     # end = " " ~ la sfarsitul print-ului sa nu treaca pe linie noua, doar sa lase un spatiu intre elemente

print()                     # new line

for i in range(3, 10):      # i va lua valorile 3,4,5,...,9
    print(i, end = " ")
     
print()

for i in range(3, 10, 3):   # i va lua valorile 3,6,9
    print(i, end = " ")
     
print("\n-------------------\n")


# Instructiuneaa break:
"""
In momentul cand se intalneste aceasta instructiune, programul "iese"
din ciclul repetitiv in care se afla in acel moment. Daca instructiunea se afla 
intr-un ciclu care este in alt ciclu, atunci doar primul dintre ele este oprit,
iar cel care il contine continua in mod normal.
"""

v = [15, 2, 9, 17, 8, 4, 25]
for i in range(2):      # repetam de 2 ori urmatoarele instructiuni
    for x in v:
        if x == 17: break  
        print (x, end = " ")
    # a se observa ca odata ce x ia valoarea 17, se iese din for-ul de pe linia 13 (fara sa mai afiseze 17), dar nu si din cel de pe linia 11
    print("am terminat iteratia", i+1) 

print("\n-------------------\n")

# Instructiuneaa continue:

"""
In momentul cand se intalneste aceasta instructiune, programul opreste ciclul la pasul curent, 
si incepe o noua iteratie
"""

v=[15, 2, 9, 17, 8, 4, 25]

for x in v:
    if x == 17: continue  
    print (x, end = " ")
    # a se observa ca odata ce x ia valoarea 17, se sare peste restul intructiunilor si se ia de la capat cu urmatorul pas
 
print("\n-------------------\n")


# Instructiunea for x in collection

V=[5,7,9,4,-2,6] #o lista de elemente cu valorile 5,7,9,4,-2,6

print("numarul de elemente din V:", len(V))
print("parcurgerea lui V folosind un for 'clasic':")

for i in range (len(V)):
    print(V[i], end = " ")

print("parcurgerea lui V folosind un 'for each', similar cu ce este in C++")

for x in V:
    print(x, end = " ") 
    
print("\n-------------------\n")

# SWITCH/CASE - exemplu simulare

month = int(input("In a cata luna suntem? "))
month_name = {
    1 : "Ianuarie",
    2 : "Februarie",
    3 : "Martie",
    4 : "Aprilie",
    5 : "Mai",
    6 :"Iunie",
    7 : "Iulie",
    8 : "August",
    9 : "Septembrie",
    10 : "Octombrie",
    11 : "Noiembrie",
    12 : "Decembrie"
}
print("Luna in care sunteti este luna " + month_name.get(month, "incorecta"))
