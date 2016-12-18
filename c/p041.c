#include <stdio.h>

#include "util.h"

int main(int argc, char** argv) {

    const int* primes = generate_primes(10000000);

    const int* last_prime = primes;
    for (; *last_prime; ++last_prime);
    --last_prime;

    for (const int* p = last_prime; p > primes; --p) {
        if (pandigital((long) *p)) {
            printf("%d\n", *p);
            break;
        }
    }
}

