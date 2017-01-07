#include <stdio.h>
#include <string.h>
#include <math.h>
#include <glib.h>

#include "util.h"

static const int LIMIT = 1500000;


int main(int argc, char** argv) {

    uint8_t lengths[LIMIT];
    memset(lengths, 0, LIMIT * sizeof(uint8_t));

	for (int m = 2; m < 1000; ++m) {
		for (int n = 1; n < m; ++n) {
            const int a = m * m - n * n;
            const int b = 2 * m * n;
            const int c = m * m + n * n;
            const int p = a + b + c;

            if ((m + n) % 2 == 1 && gcd(m, n) == 1) {
                for (int n = p; n <= LIMIT; n += p) {
                    lengths[n]++;
                }
            }
        }
    }

    int count = 0;
    for (int i = 0; i < LIMIT; ++i) {
        if (lengths[i] == 1) {
            ++count;
        }
    }
    printf("%d\n", count);
}

