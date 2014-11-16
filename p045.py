tn = set(map(lambda n: n * (n + 1) / 2, xrange(2, 100000)))
pn = set(map(lambda n: n * (3 * n - 1) / 2, xrange(2, 100000)))
hn = set(map(lambda n: n * (2 * n - 1), xrange(2, 100000)))

common = tn.intersection(pn).intersection(hn)
common.discard(40755)
print common.pop()
