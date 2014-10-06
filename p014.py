def seq_length(n):
    iterations = 1
    while n != 1:
        if n % 2 == 0:
            n /= 2
        else:
            n = 3*n + 1
        iterations += 1
    return iterations

max = -1
maxi = 0
for i in xrange(1, 10**6):
    length = seq_length(i)
    if length > max:
        max = length
        maxi = i

print maxi, max