#include <stdio.h>

#include "util.h"

static const int LIMIT = 1000000;

static int pdivisor_sum(int n);
static int length(const int chain[], int n);

int main(int argc, char** argv) {

    int chain[LIMIT];

    for (int i = 1; i < LIMIT; ++i) {
        const int result = pdivisor_sum(i);
        chain[i] = (result > LIMIT) ? 1 : result;
    }

    int smallest = LIMIT;
    int longest_length = 0;
    for (int i = 2; i < LIMIT; ++i) {
        const int l = length(chain, i);
        if (l > longest_length) {
            longest_length = l;
            smallest = i;
        }
    }

    printf("%d\n", smallest);
}

static int pdivisor_sum(int n) {
    int sum = 1;
    for (int i = 2; i * i <= n; ++i) {
        if (n % i == 0) {
            sum += i + n / i;
        }
    }
    return sum;

}

static int length(const int chain[], int n) {
    const int orig = n;
    int len = 1;
    for (int nn = n; n < LIMIT && nn < LIMIT && n != 1 && nn != 1; ++len) {
        n = chain[n];
        nn = chain[chain[nn]];

        if (n == nn) {
            // detected cycle
            if (n == orig) {
                return len;
            }
            return 1;
        }
    }

    return 1;
}
