#include <stdio.h>
#include <stdbool.h>
#include <string.h>

#include "util.h"

static const int LIMIT = 10000000;

static void identify_divisors(const int* primes, int* d1, int* d2);

int main(int argc, char** argv) {
    const int* primes = generate_primes(LIMIT / 2);

    int d1[LIMIT + 1];
    int d2[LIMIT + 1];
    memset(d1, 0, (LIMIT + 1) * sizeof(int));
    memset(d2, 0, (LIMIT + 1)* sizeof(int));

    identify_divisors(primes, d1, d2);

    long sum = 0;
    bool check[LIMIT]; // identifies whether we've seen p*q before; relies on fact that p*q is unique for any primes p,q
    memset(check, false, LIMIT * sizeof(bool));
    for (int n = LIMIT; n > 2; --n) {
        int p = d1[n];
        int q = d2[n];
        if (d1[n] > 0 && d2[n] > 0 && !check[p * q]) {
            check[p * q] = true;
            sum += n;
        }
    }
    printf("%ld\n", sum);
}

static void identify_divisors(const int* primes, int* d1, int* d2) {
    for (const int* p = primes; *p; ++p) {
        for (int i = *p * 2; i <= LIMIT; i += *p) {
            if (0 == d1[i]) {
                // first prime divisor seen for i
                d1[i] = *p;
            } else if (0 == d2[i]) {
                // second prime divisor seen for i
                d2[i] = *p;
            } else {
                // too many divisors; mark as invalid
                d1[i] = d2[i] = -1;
            }
        }
    }
}
