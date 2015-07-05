from math import sqrt

def triangles():
    i = 1
    sum = 0
    while True:
        sum += i
        i += 1
        yield sum

def divisors(n):
    count = 1
    for i in xrange(1, int(sqrt(n))):
        if n % i == 0:
            count += 2

    return count

for i in triangles():
    if i % 2 == 1:
        continue

    num_divisors = divisors(i)
    if num_divisors > 500:
        print i
        break
