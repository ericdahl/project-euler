import math
import utils

primes = utils.primes(10000)
sprimes = set(primes)
twsq = map(lambda n: 2 * n**2, xrange(1, 100))

def f(i):
    for j in primes:
        if j > i:
            return True
        root = math.sqrt((i - j) / 2)
        if root == int(root):
            break

for i in xrange(3, 1000000, 2):
    if i in sprimes:
        continue
    if f(i):
        print i
        break