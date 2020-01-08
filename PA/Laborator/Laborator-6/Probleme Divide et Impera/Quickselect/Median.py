import random

def quickselect(l, k, pivot_fn=random.choice):

    pivot = pivot_fn(l)

    lows = [el for el in l if el < pivot]
    highs = [el for el in l if el > pivot]
    pivots = [el for el in l if el == pivot]

    if k < len(lows):
        return quickselect(lows, k, pivot_fn)
    elif k < len(lows) + len(pivots):
        return pivots[0]
    else:
        return quickselect(highs, k - len(lows) - len(pivots), pivot_fn)

def pick_pivot(l):

    if len(l) <= 5:
        return sorted(l)[len(l)//2]

    chunks = [sorted(l[i:i + 5]) for i in range(0, len(l), 5)]
    # print(chunks)

    medians = [chunk[len(chunk)//2] for chunk in chunks]
    # print(medians)

    return pick_pivot(medians)

ls = [17, 4, 10, 2, 9, 3, 15, 34, 21, 7, 7, 2, 17, 4, 10, 2, 9, 8, 3, 15, 34, 21, 7, 7, 2, 17, 4, 10, 2, 9, 3, 15, 34, 21, 7, 7, 2]

k = 5
print(quickselect(ls, k, pick_pivot))