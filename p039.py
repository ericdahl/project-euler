import math

def f(n):
    solutions = [] 
    for a in xrange(1, n / 2):
        aa = a**2
        for b in xrange(a, n / 2):
            bb = b**2
            sqrt = math.sqrt(aa ++ bb)
            if a + b + sqrt == n and sqrt == int(sqrt):
                solutions.append([a, b, int(sqrt)])
    return len(solutions)

count = [ f(i) for i in range(1, 1001) ]

print count.index(max(count)) + 1
            
