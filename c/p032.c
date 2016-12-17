#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "util.h"

static int cmp(const void *p1, const void *p2) {
	int left = *(const int*) p1;
	int right = *(const int*) p2;

	return ((left > right) - (left < right));
}

int main(int argc, char** argv) {
    int matches[100];
    memset(matches, 0, 100 * sizeof(int));
	int current_match = 0;

    for (int a = 1; a < 2000; ++a) {
        for (int b = a + 1; b < 2000; ++b) {
            const int c = a * b;
			if (c > 10000) {
				break;
			}
            long n = concat(concat(a, b), c);

            if (pandigital9(n)) {
                matches[current_match++] = c;
            }
        }
    }


    qsort(&matches, 100, sizeof(int), cmp);
	int sum = 0;
    for (int i = 0; i < 100; i++) {
		if (matches[i - 1] != matches[i]) {
			sum += matches[i];
		}
    }
	printf("%d\n", sum);
}

