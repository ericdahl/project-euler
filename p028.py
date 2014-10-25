def f(n):
    l = [1] 
    curr = 2 
    for delta in range(2, n, 2): 
        for i in range(curr + delta, curr + delta * 5, delta):
            l.append(i - 1)
        curr = l[-1] + 1
    return sum(l)

print f(1001)
