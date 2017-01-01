#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

static const int LIMIT = 10000000;

static int p(const int n);

int main(int argc, char** argv) {

    bool pnumber[LIMIT]; // FIXME: extremely memory inefficient and slow
    memset(pnumber, false, (int) (LIMIT * sizeof(bool)));

    for (int i = 1; ; ++i) {
        const int result = p(i);
        if (result > LIMIT) {
            break;
        }
        pnumber[result] = true;
    }

    for (bool* j = pnumber; j - pnumber < LIMIT; ++j) {
        for (; !*j; ++j);

        const int nj = j - pnumber;

        for (bool* k = j + 1; k - pnumber < LIMIT; ++k) {
            for (; !*k; ++k);

            const int nk = k - pnumber;
            const int sum = nj + nk;
            const int diff = nk - nj;
            if (pnumber[diff] && sum < LIMIT && pnumber[sum]) {
                printf("%d\n", diff);
                exit(EXIT_SUCCESS);
            }
        }
    }


}

static int p(const int n) {
    return n * (3 * n - 1) / 2;
}
