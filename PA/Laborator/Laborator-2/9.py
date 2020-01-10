import re   # folosesc Regular Expressions (Regex) pentru a extrage numerele

str = str(input())
numere = []

str = re.sub(r'\W+', ' ', str)  # pastrez doar caracterele A-Za-z si 0-9 si elimin orice alt caracter

# extrag numere intr-un vector
for s in str.split():
    if s.isdigit():
        numere.append(int(s))

n = len(numere) - 1

if numere[n] and numere[n-1]:
    print('S-au inteles')
else:
    print('Nu s-au inteles')
