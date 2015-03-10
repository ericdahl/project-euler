import utils


def is_perm(a, b):
    return sorted(str(a)) == sorted(str(b))

best = (10000, 1)
primes = [ i for i in utils.primes(4000) if i > 2000 ]

for i in primes:
    for j in primes:
        n = i * j
        if n > 10**7:
            break
        phi = (i - 1) * (j - 1)
        ratio = (n * 1.0) / phi
        curr = (ratio, n)
        if is_perm(n, phi) and curr < best:
            best = curr

print best[1]
