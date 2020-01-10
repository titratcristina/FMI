### Curs 4 - PA ###

# ------------- Exemplul 4.1.1 ------------- #
v = [2,8,2,2,3]
v[1] += 1                           # v[1]=9 - schimbam o valoare din v. id(v) va ramane acelasi
print(v)                            # [2,9,2,2,3]
if(9 in v): print ("Da")            # se afiseaza "Da", deoarece elementul 9 se afla in v. Complexitate O(len(v))
for x in v: print(x, end = " ")     # iteram prin lista si afisam fiecare element pe o sigura linie, cu " " pe post de separator
print()                             # endline
print(v[1:4])                       # afisam un slice din lista. Complexitate O(len(slice)) 

v[1:4] = [10,20,30,40,50] 
print(v)                            # A se observa ca slice-ul din v a fost inlocuit
v[1:4][0] = -1
print(v)                            # a se observa ca v[1] nu s-a schimbar, deoarece slice-ul este un obiect diferit fata de v
w = v                               # w si v sunt acelasi obiect (au acelasi id)
w[0] = -1
print(w)
print(v)                            # schimbarea se "vede" in ambele liste, deoarce ele au in continuare acelasi id
print("\n------------------------------------------\n")


# ------------- Exemplul 4.1.2 ------------- #
v = [5, 2, 7, 9]
v.append(-1)
print(v)
print("\n------------------------------------------\n")


# ------------- Exemplul 4.1.3 ------------- #
v = [10, 20, 30]
v.extend([2,3])     # extindem lista cu 2 noi valori
print(v)            # [10, 20, 30, 2 , 3]
v.extend("ana")     # extindem lista din nou, de aceasta data cu un string ce contine 3 elemente 
print(v)            # [10, 20, 30, 2, 3, "a", "n", "a"]
print("\n------------------------------------------\n")


# ------------- Exemplul 4.1.4 ------------- #
v = [10, 20, 30]
v.insert(2, -1)     # [10, 20, -1, 30]
print(v)
print("\n------------------------------------------\n")


# ------------- Exemplul 4.1.5 ------------- #
v = [10, 20, 30, 20, 40] 
v.remove(20)
print(v)            # [10, 30, 20, 40]
print("\n------------------------------------------\n")


# ------------- Exemplul 4.1.6 ------------- #
v = [10, 20, 30, 20, 40] 
print(v.pop(2))     # 30
print(v)            # [10, 20, 20, 40] 
print("\n------------------------------------------\n")


# ------------- Exemplul 4.1.7 ------------- #
v = [1, 1, 20, 1, 1, 1, 20, 1, 1, 1]
print(v.index(20))          # 2 - deoarece primul '20' gasit se afla pe pozitia 2
print(v.index(20,4,8))      # 6 - indexul celui de-al doilea 20, mai exact primul gasit intre pozitiile 4 si 7. 
#Observam ca in ambele cazuri indexul este raportat de la inceputul lui v, nu de la inceputul intervalului in care cautam.
print("\n------------------------------------------\n")


# ------------- Exemplul 4.1.8 ------------- #
v = [5, 8, 9, 6, 3, 6]
v.sort()
print(v)            # [3, 5, 6, 6, 8, 9]  
#v.append("a")
#v.sort()           # va da eroare, deoarece stringurile nu sunt comparabile cu int-urile (operatorul < )
print("\n------------------------------------------\n")


# ------------- Exemplul 4.1.9 ------------- #
v = [5, 8, 9, 6, 3, 6]
w = v.copy()
print(w)
print("w == v?", w==v)      # w si v sunt de valori egale
print("w is v?", w is v)    # dar w si v sunt obiecte diferite
v.append(-1)                # am schimbat valoarea lui v
print(v)
print(w)                    # schimbarea din v nu are niciun impact asupra lui w. Altul ar fi fost rezultatul daca am fi scris w = v pe linia 2
print("\n------------------------------------------\n")


# ------------- Exemplul 4.2.1 ------------- #
t = ("Ana", "Maria", 25)    # un tuplu cu 3 elemente - triplet
# observam ca tuplurile nu trebuie neaparat sa fie omogene (precum nici listele)
print(t)                    # ("Ana", "Maria", 25)
print(t[0])                 # "Ana" - putem accesa si slice-uri din tuplu la nevoie
# t[0] = "Carmen" - va da eroare, deoarece tuplurile sunt imutabile, nu putem face atribuire pe elemente
u = t
print("\nu is t? ", u is t) # u si t referentiaza acelasi obiect
t = t + (9.5,)              # adaugam un element la tuplul t; id(t) se schimba!
print(t)
print(u)                    # observam ca u mentine valoarea veche
print("\n------------------------------------------\n")


# ------------- Exemplul 4.3.1 ------------- #
car = {
  "brand": "Ford",
  "model": "Mustang",
  "year": 1964
}
print(car.get("brand"))     # Ford
print(car.get("color"))     # None
print(car["model"])         # Mustang
print("\n------------------------------------------\n")


# ------------- Exemplul 4.3.2 ------------- #
car = {
  "brand": "Ford",
  "model": "Mustang",
  "year": 1964
}
print(car.items())
car.update({"price":15000})
print(car.items())
car.update({"price":150})
print(car.items())
print("\n------------------------------------------\n")

# ------------- Exemplul 4.3.3 ------------- #
car = {
  "brand": "Ford",
  "model": "Mustang",
  "year": 1964
}
print(car.keys())
print(car.values())
print(car.items())








