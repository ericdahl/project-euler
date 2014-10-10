import math


def f(n):
    return math.factorial(2*n) / ((math.factorial(n))**2)

print f(20)