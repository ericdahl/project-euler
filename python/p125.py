#!/usr/bin/env python

from math import sqrt

limit = 100000000
sum = 0
seen = set()
for i in xrange(1, int(sqrt(limit))):
    candidate = i * i
    for j in xrange(i + 1, limit):
        candidate += j * j
        if candidate > limit:
            break
        if candidate not in seen and str(candidate) == str(candidate)[::-1]:
            sum += candidate
            seen.add(candidate)

print sum
