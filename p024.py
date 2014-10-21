from itertools import permutations

i = 1
for indices in permutations(range(10), 10):
    if i == 10**6:
        print ''.join(str(digit) for digit in indices)
        break
    i += 1