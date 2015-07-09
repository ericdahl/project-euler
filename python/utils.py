from math import sqrt
from itertools import count

def divisors(n):
    r = set()
    for i in count(1):
        if i * i > n:
            break
        if n % i == 0:
            r.add(i)
            r.add(n / i)
    r.discard(n)
    return r


def primes(max):
    t = [True for i in xrange(max)]
    t[0] = t[1] = False

    i = 2
    while i * i < max:
        curr = i * 2
        while curr < max:
            t[curr] = False
            curr += i

        try:
            i += 1 + t[i + 1:].index(True)
        except ValueError:
            break

    return [index for index, value in enumerate(t) if value]
