def f(i):
    si = str(i)
    if si == si[::-1]:
        sb = str(bin(i))[2:]
        if sb == sb[::-1]:
            return True

print sum(filter(f, xrange(1, 10**6, 2)))

