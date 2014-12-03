import utils

primes = utils.primes(7654321)

def p(n):
    sn = str(n)
    lsn = len(sn)

    if lsn > 10:
        return False
    
    return set([ int(d) for d in sn ]) == set(range(1, len(sn) + 1))


primes.reverse()
for prime in primes:
    if p(prime):
        print prime
        break


