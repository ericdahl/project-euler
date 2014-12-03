pentagonals = set(map(lambda n: n * (3 * n - 1) / 2, xrange(1, 10000)))

for j in pentagonals:
    for k in pentagonals:
        if j + k in pentagonals and k - j in pentagonals:
            print k - j
