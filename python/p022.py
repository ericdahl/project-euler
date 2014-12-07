def score(name):
    return sum([ord(c) - ord('A') + 1 for c in name])


with open('../resources/p022_names.txt') as f:
    data = [name.replace('"', "") for name in f.read().split(",")]
    data.sort()
    scores = [(i + 1) * score(data[i]) for i in xrange(0, len(data))]
    print sum(scores)