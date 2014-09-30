import math
n = 600851475143

factors = []

for i in xrange(2, int(math.sqrt(n))):
    if n % i == 0:
        factors.append(i)
        n = n / i
    i += 1

print factors
