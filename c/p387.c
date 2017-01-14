#include <stdio.h>

#include "util.h"

const long LIMIT = 100000000000000;

long right_strong_prime_sum(long n, long sum);

int main(int argc, char** argv) {
    long sum = 0;
    for (int d = 1; d < 10; ++d) {
        sum += right_strong_prime_sum(d, d);
    }
    printf("%ld\n", sum);
}

long right_strong_prime_sum(const long n, const long digit_sum) {
    long total = 0;
    for (int d = 0; d < 10; ++d) {
        const long next = n * 10 + d;
        const long next_digit_sum = digit_sum + d;

        if (next > LIMIT) {
            return total;
        }

        if (next % next_digit_sum == 0) { // right
            if (is_prime(next / next_digit_sum)) { // strong
                for (int dd = 1; dd < 10; dd += 2) {
                    long nn = next * 10 + dd;
                    if (is_prime(nn) && nn < LIMIT) {
                        total += nn;
                    }
                }
            }
            total += right_strong_prime_sum(next, next_digit_sum);
        }
    }
    return total;
}
