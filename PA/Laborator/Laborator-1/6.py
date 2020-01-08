n = str(input())

ascending = ''.join(sorted(n))
descending = ''.join(sorted(n, reverse=True))

print(descending, ascending)