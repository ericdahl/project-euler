import itertools
import utils
primes = utils.primes(17)

def f(n):
    sn = str(n)
    for i in range(1, 8):
        if int(sn[i:i+3]) % primes[i - 1] != 0:
            return False
    return True

matches = []
for i in itertools.permutations('0123456789', 10):
    n = int(''.join(i))
    if f(n):
        matches.append(n)        

print matches
print sum(matches)
