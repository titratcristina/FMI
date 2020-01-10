def binary_search(v, val, s = 0, f = None):
    if f == None:
        f = len(v)
    if f-s == 1:
        if v[s] == val:
            return s
        else: raise IndexError
    else:
        mid = (s+f) // 2
        if v[mid] == val:
            return mid
        elif v[mid] > val:
            return binary_search(v, val, s, mid)
        elif v[mid] < val:
            return binary_search(v, val, mid+1, f)

L = [2, 5, 9, 12, 13, 34, 38, 55]
val = 31
print(binary_search(L, val))