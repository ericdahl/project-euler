import utils

primes = utils.primes(100)

def count(target):
    ways = [0] * (target + 1)
    ways[0] = 1

    for p in primes:
        for j in xrange(p, target + 1):
            ways[j] += ways[j - p]

    return ways[target]


for target in xrange(2, 100):
    if count(target) > 5000:
        print target
        break
