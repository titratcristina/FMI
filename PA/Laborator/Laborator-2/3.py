# inlocuire fara replace()
sir = input()
sir_nou = ''

for caracter in sir:
    if caracter == 's':
        caracter = 't'
    sir_nou += caracter

print(sir_nou)