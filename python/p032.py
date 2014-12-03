import itertools

matches = set()
for i in itertools.permutations('123456789', 9):
    for s in xrange(1, 4):
        for s2 in xrange(s + 1, (14 - s) / 2):
            a = int(''.join(i[:s]))
            b = int(''.join(i[s:s2]))
            c = int(''.join(i[s2:]))
            if a * b == c:
                matches.add(c)

print sum(matches)