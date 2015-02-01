def g(power):
    count = 0
    i = 1
    min = 10**(power - 1)
    max = 10**power - 1

    while True:
        result = i**power
        if result >= min:
            if result <= max:
                count += 1
            else:
                break
        i += 1

    return count

count = 0
for i in xrange(1, 1000):
    current = g(i)
    if current > 0:
        count += current
    else:
        break

print count

