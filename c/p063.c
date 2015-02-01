#include <stdio.h>
#include <stdlib.h>

#include <gmp.h>

// cc -Wall -I/usr/local/include -L/usr/local/lib -lgmp p063.c


int count(unsigned int exp) {
    int c = 0;

    mpz_t base;
    mpz_init_set_ui(base, 1);

    mpz_t min;
    mpz_init(min);
    mpz_ui_pow_ui(min, 10, exp - 1);

    mpz_t max;
    mpz_init(max);
    mpz_ui_pow_ui(max, 10, exp);

    mpz_t res;
    mpz_init(res);

    for (;; mpz_add_ui(base, base, 1)) {
        mpz_pow_ui(res, base, exp);
        if (mpz_cmp(res, min) >= 0) {
            if (mpz_cmp(res, max) < 0) {
                c += 1;
            } else {
                break;
            }
        }
    }

    mpz_clears(base, min, max, res, 0);
    return c;

}

int main(int argc, char** argv) {

    unsigned int total = 0;
    for (unsigned int exp = 1; ; ++exp) {
        int current = count(exp);
        if (current == 0) {
            break;
        } else {
            total += current;
        }
    }

    printf("%d\n", total);
    return EXIT_SUCCESS;
}
