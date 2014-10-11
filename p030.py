# there are only three numbers that can be written as the sum of their digits:
#  1634 = 1**4 + 6**4 + 3**4 + 4**4
#  8208
#  9474
#
# as 1 = 1**4 is not a sum, it is not included
# the sum of these numbers is 19316
# find the sum of all the numbers that can be written as the sum of their fifth powers of their digits

m = {}
for i in xrange(0, 10):
    m[str(i)] = i**5

def f(n):
    return sum([ m[c] for c in str(i) ])

print sum([ i for i in xrange(2, 1700000) if i == f(i) ])
