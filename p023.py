from itertools import combinations_with_replacement


def divisors(n):
    r = set()
    for i in range(1, n / 2):
        if n % i == 0:
            r.add(i)
            r.add(n / i)
    r.discard(n)
    return r

abundant = filter(lambda n: sum(divisors(n)) > n, range(2, 29000))

u = set(range(1, 29000))
for i in combinations_with_replacement(abundant, 2):
    u.discard(sum(i))

print sum(u)
