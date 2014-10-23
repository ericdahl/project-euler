import math
df = [ math.factorial(i) for i in range(10) ]

def f(n):
    return sum([ df[int(i)] for i in str(n)])

matches = filter(lambda n: f(n) == n, xrange(3, 100000))

print matches
print sum(matches)

