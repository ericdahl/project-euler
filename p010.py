
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

if __name__ == '__main__':
    p = primes(5000000)
    print p[-1]
    print sum(filter(lambda i: i < 2 * 10**6, p))

