### Curs 5 - PA ###

# ------------- Exemplul 5.1 ------------- #
def myfunc1(elem):
    # aici documentez functia
    print("Hello " + elem)
    return None

print(myfunc1.__doc__)
print("Apelul functiei:")
myfunc1("World!")
print("\n------------------------------------------\n")


# ------------- Exemplul 5.2 ------------- #
def myfunc2(mymessage,name="World", greet="It's a nice day"):
    #aici documentez functia
    print("Hello",name,greet)
    print(mymessage)

myfunc2("My awesome string parameter","John!")
print("\n------------------------------------------\n")


# ------------- Exemplul 5.3 ------------- #
x = 10

def myfunc3():
    x = 20
    y = 30
    print("x-ul local din functie:", x)
    print("y-ul local din functie:", y)
    
print("x-ul global inainte de apelul functiei", x)   # 10
myfunc3()                                            # 20
print("x-ul global dupa apelul functiei", x)         # 10 
#print (y) - ar da eroare, deoarece y nu este vazut in acest bloc de cod, y fiind vizibil doar in interiorul functiei

print("\n------------------------------------------\n")


# ------------- Exemplul 5.4 ------------- #
l1 = [1,2,3]
l2 = []
x = 0

def myfunc4():
    global l2, x        #fara aceasta declarare, instantierile lui l2 si x  ar fi dat eroare.
    l2=l1.copy()        #se realizeaza o atribuie, deci l2 trebuie declarata folosind "global"
    x=1                 # la fel si in cazul acesta
    l1.append(10)       #aici insa putem accesa l1, si ii modificam valoarea fara probleme, pt ca aici nu se realizeaza o atribuire.

myfunc4()
print(l1)
print(l2)
print(x)
print("\n------------------------------------------\n")


# ------------- Exemplul 5.5 ------------- #
def myfunc5(x, l):
  x = 10            # aici are loc o atribuire, x capata un nou id, x referentiaza un nou obiect care va disparea dupa executarea functiei
  l.append(10)      # aici nu este o atribuire, l isi pastreaza id-ul initial, valoarea obiectului se modifica (se concateneaza 10 la lista)
  print("x-ul local:", x)
  print("lista locala:", l)
 
a = 0
mylist = [1,2,3]
myfunc5(a, mylist)
print("\n a si mylist dupa executia functiei:\n", a, "\n", mylist) #a ramane nemodificat, lista se modifica
print("\n------------------------------------------\n")


# ------------- Exemplul 5.6 ------------- #
def mysum(*vals):
    s = 0
    for elem in vals:
        s += elem
    return s
    
print(mysum(5, 4, 8, 9))

print("\n------------------------------------------\n")

def mysum2(a, *vals, b):
    print("a =", a)
    print("b =", b)
    s = 0
    for elem in vals:
        s += elem
    return s
    
print("suma este", mysum2(100, 5, 4, 8, 9, b=200)) #nu este nevoie sa scriu a=100, implicit prima valoare este atribuita lui a. 
#dar deoarece b este declarat dupa lista de valori *vals, acesta trebuie initializat explicit prin nume
print("\n------------------------------------------\n")


# ------------- Exemplul 5.7 ------------- #
def myFib(n):
    # myFib(n) genereaza situl lui Fibonacci de la Fib(0), pana la Fib(n), inclusiv.
    a = b = 1
    yield a
    for x in range(n):
        yield b
        a, b = b, a+b

for x in myFib(7):
    print(x, end = " ")
    
