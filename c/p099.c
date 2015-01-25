#include <stdio.h>
#include <stdlib.h>

#include <gmp.h>

// cc -Wall -I/usr/local/include -L/usr/local/lib -lgmp p099.c

int main(int argc, char** argv) {
    // Note: slow (~ 40s)

    FILE* file = fopen("resources/p099_base_exp.txt", "r"); 

    mpz_t current;
    mpz_init(current);
    
    mpz_t max;
    mpz_init(max);

    int max_index = 1;
    char line[128];
    for (int current_index = 1; fgets(line, sizeof line, file); ++current_index) {
        char* c = line;
        for (; *c != ','; ++c); 
        *c = 0;
        
        mpz_set_str(current, line, 10);
        mpz_pow_ui(current, current, atoi(c + 1));
        if (mpz_cmp(current, max) > 0) {
            mpz_set(max, current);
            max_index = current_index;
        }

        current_index++;
    }
    fclose(file);

    printf("%d\n", max_index);

    return 0;
}
