# find the sum of the digits in the number 100!

import math
def f(n):
    return sum([ int(c) for c in str(math.factorial(n)) ])

print f(100)
