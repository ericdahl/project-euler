import itertools
from collections import defaultdict


def map_word(source_word, target_word, num):

    mapping = dict(zip(source_word, num))

    if len(set(mapping.values())) != len(mapping.values()):
        # each number can only be used once
        return False

    return ''.join([mapping[letter] for letter in target_word])


with open('../resources/p098_words.txt') as f:
    d_words = defaultdict(set)
    l = f.readline().replace('"', '').split(',')
    for word in l:
        d_words[''.join(sorted(word))].add(word)
    d_words = {k: v for k, v in d_words.items() if len(v) > 1}

d_squares = defaultdict(set)
for i in xrange(4, 100000):
    square_ordered = ''.join(sorted(str(i * i)))
    if not square_ordered.startswith('0'):
        d_squares[square_ordered].add(str(i * i))
d_squares = {k: v for k, v in d_squares.items() if len(v) > 1}

max_square = 0

for k in d_words:
    for c in itertools.combinations(d_words[k], 2):
        for kn in d_squares:
            if len(k) != len(kn):
                continue
            for cn in itertools.combinations(d_squares[kn], 2):
                for p in itertools.product([c], cn):
                    (source_word, target_word) = p[0]
                    candidate_number = p[1]
                    res = map_word(source_word, target_word, candidate_number)
                    if res in d_squares[kn] and int(res) > max_square:
                        max_square = int(res)

print max_square



