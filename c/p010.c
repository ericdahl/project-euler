#include <stdio.h>
#include <stdlib.h>

#include "util.h"

int main(int argc, char** argv) {

    const int limit = 2000000;
    unsigned long sum = 0;
    const int* const primes = generate_primes(limit);
    for (int i = 0; primes[i]; i++) {
        sum += (unsigned long) primes[i]; 
    }

    printf("%lu\n", sum);
    free((int*) primes);
}
