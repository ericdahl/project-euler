def same(a, b):
    return sorted(str(a)) == sorted(str(b))

for i in xrange(1, 1000000):
    if same(i, 2 * i) and same(3 * i, 4 * i) and same(5 * i, 6 * i) and same(i, 6 * i):
        print i
        break