#include <stdio.h>

#include <gmp.h>

int main(int argc, char** argv) {
    mpz_t product;
    mpz_init_set_ui(product, 1);

    for (int i = 1; i <= 100; ++i) {
        mpz_mul_ui(product, product, i);
    }
    
    int sum = 0;
    for (char* p = mpz_get_str(NULL, 10, product); *p; ++p) {
       sum += *p - '0'; 
    }
    printf("%d\n", sum);
}

