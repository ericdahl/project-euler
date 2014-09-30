
(min, max) = (2, 1000000)
t = range(min, max + 1)

i = 0
p = t[i]
while p**2 < max:
    t = filter(lambda n: n == p or n % p != 0, t)
    i += 1
    p = t[i]

print t[10000]

