#include <stdio.h>

#include <gmp.h>

// cc -Wall -I/usr/local/include -L/usr/local/lib -lgmp p100.c

int main(int argc, char** argv) {

    /* FIXME: slow (2h 20m) */

    mpz_t discs;
    mpz_init(discs);
    mpz_ui_pow_ui(discs, 10, 12);

    mpz_t r;
    mpz_init(r);

    mpz_t rem;
    mpz_init(rem);
    for (; ; mpz_add_ui(discs, discs, 1)) {
        /* use quadratic equation to solve for
         * b/t * (b-1)/(t-1) = 1/2
         * if there's an integral solution, return it
         */
         mpz_sub_ui(r, discs, 1);
         mpz_mul(r, r, discs);
         mpz_mul_ui(r, r, 8);
         mpz_add_ui(r, r, 4);
         mpz_sqrtrem(r, rem, r);

         if (0 == mpz_cmp_ui(rem, 0)) {
             mpz_add_ui(r, r, 2);
             mpz_cdiv_q_2exp(r, r, 2);
             gmp_printf("%Zd\n", r);
             break;
         }
    }
    return 0;
}
