max = 20

def divisible(n):
    for j in xrange(1, max + 1):
        if n % j != 0:
            return False
    return True

i = max
while not divisible(i):
    i += max

print i