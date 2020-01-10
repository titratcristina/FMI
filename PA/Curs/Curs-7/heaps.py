import heapq as HQ
L = [2, 5, 7, 9, 6, 10, 8, 12, 3, 1]
HQ.heapify(L)
print(L)
HQ.heappush(L,3)
print(L)
HQ.heappush(L,3)
print(L)
print(HQ.heappop(L))
print(L)
