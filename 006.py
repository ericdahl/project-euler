def sum_squares(l):
    return reduce(lambda x, y: x + y**2, l)


def square_sums(l):
    return reduce(lambda x, y: x + y, l) ** 2

r = range(1, 101)

ssum = sum_squares(r)
ssquare = square_sums(r)
delta = ssquare - ssum

print ssum, ssquare, delta
