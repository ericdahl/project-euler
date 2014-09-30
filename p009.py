max = 10000

for a in xrange(1, max):
    for b in xrange(a + 1, max):
        c = 1000 - a - b
        if c < 0:
            break
        if a**2 + b**2 == c**2:
            print a, b, c
            print a * b * c
            break
