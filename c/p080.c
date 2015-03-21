#include <stdio.h>
#include <stdlib.h>

#include <gmp.h>

// cc -Wall -I/usr/local/include -L/usr/local/lib -lgmp p080.c

int main(int argc, char** argv) {

    mpf_t root;
    mpf_init2(root, 5000);

    mp_exp_t ptr;

    const unsigned int BUF_LEN = 101;
    char buf[BUF_LEN];

    unsigned long total = 0;
    for (int i = 2; i <= 100; ++i) {
        mpf_sqrt_ui(root, i);

        if (mpf_cmp_ui(root, mpf_get_ui(root)) == 0) {
            continue;
        }

        mpf_get_str(buf, &ptr, 10, 102, root);
        for (char* c = buf; c - buf < 100; c++) {
            total += *c - '0';
        }
    }

    printf("%lu\n", total);
    return EXIT_SUCCESS;
}
