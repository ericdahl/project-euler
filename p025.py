def fib():
    term, i, j = 0, 0, 1
    while True:
        yield term, i
        term += 1
        i = j + i
        j = i - j

for term, i in fib():
    if len(str(i)) >= 1000:
        print term
        break

