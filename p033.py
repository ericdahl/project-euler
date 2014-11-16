import fractions

def f(i, j):
    si = str(i)
    sj = str(j)
    if si[1] == sj[0] and si != sj and sj[1] != '0' and 1.0 * i / j == 1.0 * int(si[0]) / int(sj[1]):
        return True
    if si[0] == sj[1] and si != sj and sj[0] != '0' and 1.0 * i / j == 1.0 * int(si[1]) / int(sj[0]):
        return True
    return False

numerator = 1
denominator = 1
for i in xrange(10, 100):
    for j in xrange(i, 100):
        if f(i, j):
            numerator *= i
            denominator *= j

print fractions.Fraction(numerator, denominator).denominator