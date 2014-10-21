from utils import divisors


def d(n):
    return sum(divisors(n))

print sum(filter(lambda n: n != d(n) and n == d((d(n))), range(1, 10000)))