# Dynamic programming Python implementation of LIS problem

# lis returns length of the longest increasing subsequence
# in arr of size n
def lis(v):
	n = len(v)

	# Declare the list (array) for LIS and initialize LIS
	# values for all indexes
	T = [1]*n

	# Compute optimized LIS values in bottom up manner
	for i in range (1 , n):
		for j in range(0 , i):
			if v[i] > v[j] and T[i]< T[j] + 1 :
				T[i] = T[j]+1

	# Initialize maximum to 0 to get the maximum of all
	# LIS
	maximum = 0

	# Pick maximum of all LIS values
	for i in range(n):
		maximum = max(maximum , T[i])

	return maximum
# end of lis function

# Driver program to test above function
v = [10, 22, 9, 33, 21, 50, 41, 60]
print("Length of lis is", lis(v))


# Dynamic Programming implementation of LCS problem

def lcs(X, Y):
    # find the length of the strings
    m = len(X)
    n = len(Y)

    # declaring the array for storing the dp values
    T = [[None] * (n + 1) for i in range(m + 1)]

    """Following steps build L[m+1][n+1] in bottom up fashion 
    Note: L[i][j] contains length of LCS of X[0..i-1] 
    and Y[0..j-1]"""
    for i in range(m + 1):
        for j in range(n + 1):
            if i == 0 or j == 0:
                T[i][j] = 0
            elif X[i - 1] == Y[j - 1]:
                T[i][j] = T[i - 1][j - 1] + 1
            else:
                T[i][j] = max(T[i - 1][j], T[i][j - 1])

                # L[m][n] contains the length of LCS of X[0..n-1] & Y[0..m-1]
    return T[m][n]


# Driver program to test the above function
X = [1,2,3,4]
Y = [1,2,3,6]
print("Length of LCS is", lcs(X, Y))


def knapSack(W, wt, val, n):
    K = [[0 for x in range(W + 1)] for x in range(n + 1)]

    # Build table K[][] in bottom up manner
    for i in range(n + 1):
        for w in range(W + 1):
            if i == 0 or w == 0:
                K[i][w] = 0
            elif wt[i - 1] <= w:
                K[i][w] = max(val[i - 1] + K[i - 1][w - wt[i - 1]], K[i - 1][w])
            else:
                K[i][w] = K[i - 1][w]

    return K[n][W]


# Driver program to test above function
val = [60, 100, 120]
wt = [10, 20, 30]
W = 50
n = len(val)
print(knapSack(W, wt, val, n))