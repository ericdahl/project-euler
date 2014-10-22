import utils

primes = set(utils.primes(10**6))

def rotations(n):
    sn = str(n)
    return set([ int(sn[i:] + sn[:i]) for i in range(len(sn)) ])

print len(filter(lambda n: rotations(n).issubset(primes), primes.copy())) 
