# euler discoverd the remarkable quadratic equation
#
# n**2 + n + 41
#
# It turns out that the formula will produce 40 primes for the consecutive values n=0 to 39
#
# howver, when n = 40, the result is not prime
# 
# n**2 - 79n + 1601 produces 80 consecutive primes for the consecutive values n=0 to 79. the produce of the coefficients -79 and 1601 is -126479
#
# considering quadratics of the  form n**2 + an + b where abs(a) < 1000 and abs(b) < 1000, find the product of the coefficients a and b for the quadratic expression which produces the maximum number of primes for consective values of n starting with 0

import utils


def f(b, c, n):
    return n**2 + b*n + c

primes = utils.primes(10000)

maximum = {'prime': 0}
for b in range(-1000, 1001):
    for c in range(-1000, 1001):
        #print b,c
        for n in xrange(0, 10000):
            res = f(b, c, n)
            if res not in primes:
                if n > maximum['prime']:
                    maximum['prime'] = n - 1
                    maximum['b'] = b
                    maximum['c'] = c
                break

print maximum
print maximum['b'] * maximum['c']            
