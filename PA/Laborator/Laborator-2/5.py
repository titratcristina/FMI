sir = input()
k = int(input())
sir_nou = ''

# ord() - returneaza unicode-ul caracterului
# chr() - returneaza caracterul pe baza unicode-ului

for caracter in sir:
    if caracter.isupper():
        sir_nou += chr((ord(caracter) + k - ord('A')) % 26 + ord('A'))
    elif caracter.islower():
        sir_nou += chr((ord(caracter) + k - ord(*'a'))% 26 + ord('a'))
    else:
        sir_nou += c

print(sir_nou)
