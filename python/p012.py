from time import time

# FIXME: extremely inefficient (~4 hours)

def triangles():
    i = 1
    sum = 0
    while True:
        sum += i
        i += 1
        yield sum

def divisors(n):
    count = 1
    for i in xrange(1, n):
        if n % i == 0:
            count += 1

    return count

start = time()
x = triangles()
for i in triangles():
    num_divisors = divisors(i)
    if num_divisors > 500:
        print i
        break

end = time()
print end-start