str = str(input())
sum = 0

for cuvant in str.split():
    if cuvant.isdigit():
        sum += int(cuvant)

print(sum)


