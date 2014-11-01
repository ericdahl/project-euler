import utils
import itertools

primes = set(filter(lambda n: n >= 1000, utils.primes(9999)))

def same_digits(x, y):
    return set(str(x)) == set(str(y))

for p in primes:
    for i in range(1, (10000 - p) / 2):
        pi = p + i
        pii = pi + i
        if pi in primes and pii in primes and same_digits(p, pi) and same_digits(p, pii):
            print str(p) + str(p + i) + str(p + i + i)
