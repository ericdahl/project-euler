def divisors(n):
    r = set()
    for i in range(1, n / 2):
        if n % i == 0:
            r.add(i)
            r.add(n / i)
    r.discard(n)
    return r

def primes(max):
    (min, max) = (2, max)
    t = range(min, max + 1)

    i = 0
    p = t[i]
    while p**2 < max:
        t = filter(lambda n: n == p or n % p != 0, t)
        i += 1
        p = t[i]

    return t