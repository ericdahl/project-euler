#include <stdio.h>

#include "util.h"

static const int LIMIT = 1000000;

int main(int argc, char** argv) {

    const int* primes = generate_primes(LIMIT);
    const bool* prime_array = generate_prime_array(LIMIT);

    int max_length = 0;
    int max_length_prime = 0;
    for (const int* a = primes; *a; a++) {
        int sum = *a;
        for (const int* b = a + 1; *b && sum < LIMIT; b++) {
            sum += *b;
            if (prime_array[sum] && (b - a) > max_length) {
                max_length = b - a;
                max_length_prime = sum;
            }
        }
    }

    printf("%d\n", max_length_prime);
}

