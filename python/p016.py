# 2**15 = 32768 and the sum of its digits is 3+2+7+6+8=26
# what is the sum of the digits of the number 2**1000?

def f(n):
    return sum([ int(c) for c in str(2**n)])

print f(1000)

