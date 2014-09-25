i = 1
j = 2
total = 0

while i < 4000000:
    if i % 2 == 0:
        total += i
    j = i + j
    i = j - i

print total


