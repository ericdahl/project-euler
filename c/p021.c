#include <stdio.h>

#include "util.h"

static const int LIMIT = 10000;

int main(int argc, char** argv) {

    int sums[LIMIT];
    for (int i = 2; i < LIMIT; ++i) {
        const int sum = divisor_sum(i);
        if (sum < LIMIT) {
            sums[i] = sum;
        }
    }

    long total = 0;
    for (int a = 2; a < LIMIT; ++a) {
        const int b = sums[a];
        if (b > 0 && b < LIMIT && a != b && a == sums[b]) {
            total += a + b;
        }
    }
    printf("%ld\n", total / 2);
}
