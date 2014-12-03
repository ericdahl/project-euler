def f(n):
    return sum([ i**i for i in range(1, n + 1) ])

print str(f(1000))[-10:]
