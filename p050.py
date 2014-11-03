import utils

primes = utils.primes(10**6)
sprimes = set(primes)

max_primes = 0
max_s = 0
s = 0

# 959 seconds
for i in xrange(len(primes)):
    s = sum(primes[i:i + max_primes])
    for j in xrange(i + max_primes, len(primes)):
        s += primes[j]
        if s in sprimes:
            if j - i > max_primes:
                max_primes = j - i
                max_s = s

print max_primes
print max_s