from itertools import combinations_with_replacement
from utils import divisors


abundant = filter(lambda n: sum(divisors(n)) > n, range(2, 29000))

u = set(range(1, 29000))
for i in combinations_with_replacement(abundant, 2):
    u.discard(sum(i))

print sum(u)
