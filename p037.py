import utils

primes = utils.primes(1000000)

def truncatable(n):
    sn = str(n)
    if len(sn) < 2:
        return False

    for i in range(1, len(sn)):
        if int(sn[0:i]) not in primes or int(sn[-i:]) not in primes:
            return False 
    return True

tprimes = filter(truncatable, primes)

print tprimes
print len(tprimes)
print sum(tprimes)
