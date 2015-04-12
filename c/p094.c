#include <stdio.h>
#include <stdlib.h>

#include <gmp.h>

//  cc -Wall -I/usr/local/include -L/usr/local/lib -O2 -lgmp p094.cc

int int_area(long a, long b, long c);

int main(int argc, char** argv) {

    mpz_t s, sa, sb, sc;
    mpz_inits(s, sa, sb, sc, 0);

    const long max = 1000000000;
    unsigned long long sum = 0;
    for (int a = 2; a < max / 3; ++a) {
        for (int j = -1; j <= 1; j += 2) {
            const int b = a;
            const int c = a + j;

            mpz_set_ui(s, 0);
            mpz_add_ui(s, s, a);
            mpz_add_ui(s, s, b);
            mpz_add_ui(s, s, c);

            if (mpz_cdiv_q_ui(s, s, 2) == 0) {
                mpz_set(sa, s);
                mpz_sub_ui(sa, sa, a);

                mpz_set(sb, s);
                mpz_sub_ui(sb, sb, b);

                mpz_set(sc, s);
                mpz_sub_ui(sc, sc, c);

                mpz_mul(s, s, sa);
                mpz_mul(s, s, sb);
                mpz_mul(s, s, sc);

                if (mpz_perfect_square_p(s)) {
                    sum += a + b + c;
                }
            }
        }
    }

    printf("%llu\n", sum);

    return 0;
}