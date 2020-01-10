### Curs 3 - PA ###

# ------------- Exemplul 3.1.1 ------------- #
W = "Ana are mere si pere"
S = 'Ana are mere'
print("Tipul lui W", type(W),"\nTipul lui S ", type(S))
print("\n------------------------------------------\n")


# ------------- Exemplul 3.1.2 ------------- #
S = "Ana are mere"
print ('lungimea lui "' + S + '": ', len (S))
#Concatenam 8 carectere la dreapta lui S
S += " si pere"
print ('lungimea lui "' + S + '": ', len (S))
print("\n------------------------------------------\n")


# ------------- Exemplul 3.1.3 ------------- #
S = W = "Ana are mere"
print("S si W sunt acelasi obiect: ", (S is W))
print("Ambele au id-ul:", id(S))
S += "si pere"          # modificam valoarea lui S - se genereaza un nou string iar S il va referentia pe el
print(S + "\n" + W)     # Observam ca S s-a schimbat, dar W ramane cu aceasi valoarea
print("ID(S): ", id(S), "\nID(W): ", id(W)) #Id-ul lui S s-a schimbat, al lui W a ramas acelasi
print("\n------------------------------------------\n")


# ------------- Exemplul 3.1.4 ------------- #
S = "Ana are mere"
for x in S:                 # pt fiecare caracter x din S
    print(x, end = "*")     # afisez x, urmat de un *
print("\n", type(x))        # tipul lui x este str. Nu exista echivalentul lui 'char' din C++
print("\n------------------------------------------\n")


# ------------- Exemplul 3.1.5 ------------- #
S = "Ana are mere"
print(S[2])         # afisez al 3-lea caracter din string (indexarea de la 0) S[2] este un string de lungime 1
print(S[4:])        # S[4:] este sirul obtinut din eliminarea primelor 4 caractere ale lui S
print(S[:3])        # S[:3] este prefixul de lungime 3 al lui S
print(S[4:10])      # S[4:10] este felia din S care incepe de la alementul indexat cu 4 si se termina cu elementul indext cu 9
# atribuirea S[3]="x" da eroare
print("\n------------------------------------------\n")


# ------------- Exemplul 3.1.6 ------------- #
S = "Ana are mere"
W = "Ana are " + "mere"
Y = "ana are mere"
print(W is S)       # W si S sunt obiecte diferite
print(W == S)       # dar W si S au aceasi valoare
print(Y == S)       # Y si S au valori diferite din cauza majusculelor
print("\n------------------------------------------\n")


# ------------- Exemplul 3.2.1 ------------- #
S = "Ana are mere"
print(S.upper())    # ANA ARE MERE                                                                                                                                  
print(S.lower())    # ana are mere
print(S.title())    # Ana Are Mere
print(S)            # "Ana are mere" - a se observa ca valoarea lui S nu se schimba. 
#metodele mai sus exemplificate creaza un nou sir, nu il modifica pe S!
print("\n------------------------------------------\n")


# ------------- Exemplul 3.2.2 ------------- #
print("335".isnumeric())        # True
print("335a".isnumeric())       # False
print("335.64".isnumeric())     # False - contine acel '.' care nu este cifra
print("\n------------------------------------------\n")


# ------------- Exemplul 3.2.3 ------------- #
S = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"
print(S.startswith("Lore"))             # True
print(S.startswith("LoRe"))             # False
print(S.startswith("LoRe".title()))     # True - "LoRe".title() returneaza stringul "Lore"
print("\n------------------------------------------\n")


# ------------- Exemplul 3.2.4 ------------- #
S = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"
A = S.split()               # face split dupa caracterul ' ', ignora cuvintele de lungime 0 rezultate
B = S.split(None,5)         # face split dupa ' ', dar aplica de maxim 5 ori (rezulta maxim 6 taieturi)
C = S.split(", ")           # face split dupa sirul ", "
print(A)
print(B)
print(C)
print("\n------------------------------------------\n")


# --------------- Exercitiu --------------- #
W = "23 15 14a -7 -10b 9 -1 b -" #numerele ce trebuiesc insumate ar fi 23, 15, -7, 9, -1 -> suma 39
S = 0
for x in W.split():
    if x.isnumeric(): S += int(x)
    elif x.startswith("-") and x[1:].isnumeric(): 
        S += int(x)               # alternativ ar fi S -= int(x[1:])
print("suma este: ", S)
print("\n------------------------------------------\n")


# ------------- Exemplul 3.3.1 ------------- #
A = []                      # lista vida
B = [2, 5, "hello", 4.2]    # lista cu 4 elemente. Se observa ca lista poate contine elemente de tipuri diferite.
C = [0]*5                   # lista cu 5 elemente, toate 0
print(A, "lungime:", len(A) )
print(B, "lungime:", len(B) )
print(C,"lungime:", len(C) )
print("\n------------------------------------------\n")


# ------------- Exemplul 3.3.2 ------------- #
B = [2, 5, "hello", 4.2]    # lista cu 4 elemente. Se observa ca lista poate contine elemente de tipuri diferite.
for x in B:
    print(x)
print("\n------------------------------------------\n")

# ------------- Exemplul 3.3.3 ------------- #
A = B = [10,15,35,80]       # lista cu 4 elemente.
print(A is B)               # A si B sunt acelasi obiect deoarece anterior am scis A=B
print("id(A):", id(A))      # id-ul lui A este acelasi cu al lui B
print(A)
A[0] = 22                   # Schimbam ceva in lista
print(A)
print("id(A):", id(A))      # A nu isi schimba id-ul
print(B)                    # schimbarea din A "se vede" si in B pentru ca A si B au acelasi id, sunt acelasi obiect
print(A is B)
print("\n------------------------------------------\n")


# ------------- Exemplul 3.3.4 ------------- #
L = [10,20,30,40,50,60,70,80]   # L=[*range(10,81,10)]  - alternativ in acest caz am fi putut scrie mai scurt 
A = L[:3]                       # A va fi o lista formata din primele 3 elemente ale lui L
B = L[5:]                       # B va fi o lista formata din L eliminand primele 5 elemente
C = L[4:7]                      # C va fi o lista formata din elementele L[4],L[5],L[6]
print(A)
print(B)
print(C)
#Observatie: L, A, B, C au ID-uri diferite. Orice modificare adusa unuia dintre obiecte nu se va "vedea" in restul
print("\n------------------------------------------\n")


# ------------- Exemplul 3.3.5 ------------- #
L = [10,20,30,40,50,60,70,80]   #alternativ in acest caz am fi putut scrie mai scurt L=[*range(10,81,10)] 
L[4:7] = [3,1]                  #inlocuim subsecenta [50, 60, 70] din L cu elementele [3,1]
print(L)





