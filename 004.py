def pal(value):
    return str(value) == str(value)[::-1]


p = 1

for i in xrange(999, 99, -1):
    for j in xrange(999, 99, -1):
        n = i * j
        if n > p and pal(n):
            p = n

print p