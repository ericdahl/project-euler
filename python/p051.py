from collections import Counter
import utils
import itertools


def is_match(result, prime):
    target = -1
    for result_digit, prime_digit in zip(result, prime):
        if result_digit == -1:
            if target == -1:
                target = prime_digit
            elif target != prime_digit:
                return False
        elif result_digit != prime_digit:
            return False

    return True


def main():
    length = 6
    primes = [str(prime) for prime in utils.primes(10 ** length) if 10 ** (length - 1) < prime < 10 ** length]
    counter = Counter()

    for prime in primes:
        digit_counter = Counter(prime)

        for d, digit_count in digit_counter.iteritems():
            if digit_count == 1:
                continue
            indices = [i for i, x in enumerate(prime) if x == d]
            for length in xrange(2, digit_count + 1):
                for i in itertools.combinations(indices, length):
                    counter.update([tuple([digit if digit_index not in i else -1 for digit_index, digit in enumerate(prime)])])

    result = counter.most_common(1)[0][0]

    for prime in primes:
        if is_match(result, prime):
            print prime
            break


if __name__ == '__main__':
    main()
