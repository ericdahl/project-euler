#include <stdio.h>

#include <gmp.h>

int main(int argc, char** argv) {
    mpz_t n;
    mpz_init(n);
    mpz_ui_pow_ui(n, 2, 1000);
    
    int sum = 0;
    for (char* p = mpz_get_str(NULL, 10, n); *p; ++p) {
       sum += *p - '0'; 
    }
    printf("%d\n", sum);
}

