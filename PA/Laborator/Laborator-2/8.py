# a)
text = input()
vocale = 'aeiouAEIOU'
text_nou = ''

for caracter in text:
    if(caracter in vocale):
        text_nou += caracter + 'p' + caracter.lower()
    else:
        text_nou += caracter

print(text_nou)

# b)
text = input()
text_nou = ''

for caracter in text:
    if caracter == '-' or caracter == ' ':
        text_nou = text_nou + 'p' + caracter_prec.lower()
    text_nou += caracter
    caracter_prec = caracter

print(text_nou)

text_nou = text_nou.replace('-','')

print(text_nou)
