import utils

def factor_map(max):
    m = {}
    
    primes = utils.primes(max)
    sprimes = set(primes)
    for n in xrange(1, max):
        if n in sprimes:
            m[n] = set()
            continue

        factors = []
        for p in primes:
            if p < n and n % p == 0:
                factors.append(p)
        m[n] = set(factors)
    return m


m = factor_map(12001)

count = 0
min = 1.0 / 3.0
max = 1.0 / 2.0
for d in xrange(2, 12001):
    for n in xrange(d / 3 + 1, (d - 1) / 2 + 1):
        result = 1.0 * n / d
        if min < result < max and m[n].isdisjoint(m[d]):
               count += 1

print count

