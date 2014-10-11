# if the numbers 1 to 5 are written out in words: one, two, threee, four, five, then there are 3+3+5+4+4=19 letters used in total

# if all the numbers from 1 to 1000 inclusive were written out in words, how many letters would be used?

# don't count spaces or hyphens. for example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. 

m = {}
m[1] = "one"
m[2] = "two"
m[3] = "three"
m[4] = "four"
m[5] = "five"
m[6] = "six"
m[7] = "seven"
m[8] = "eight"
m[9] = "nine"
m[10] = "ten"
m[11] = "eleven"
m[12] = "twelve"
m[13] = "thirteen"
m[14] = "fourteen"
m[15] = "fifteen"
m[16] = "sixteen"
m[17] = "seventeen"
m[18] = "eighteen"
m[19] = "nineteen"
m[20] = "twenty"
m[30] = "thirty"
m[40] = "forty"
m[50] = "fivty"
m[60] = "sixty"
m[70] = "seventy"
m[80] = "eighty"
m[90] = "ninety"
m[100] = "hundred"
m[1000] = "thousand"

def f(n):
    if n <= 20:
        return m[n]
    elif n % 10 == 0 and n <= 90:
        return m[n]
    elif n % 1000 == 0:
        return '%s %s' % (m[n / 1000], m[1000])
    elif n % 100 == 0:
        return '%s %s' % (m[n / 100], m[100])
    elif n >= 100:
        return '%s %s and %s' % (m[n / 100], m[100], f(n % 100))
    else:
        lower = n / 10 * 10
        return '%s-%s' % (f(lower), m[n%10])

def g(n):
    return len(f(n).replace('-', '').replace(' ', ''))

print sum([ g(i) for i in xrange(1, 1001) ])
