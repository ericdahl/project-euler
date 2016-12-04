#include <stdio.h>

#include "util.h"

int main(int argc, char** argv) {

    long int largest = 0;
    for (int i = 100; i < 1000; i++) {
        for (int j = i; j < 1000; j++) {
            const long product = i * j;
            if (product > largest && palindrome(product)) {
                largest = product;
            }
        }
    }
    printf("%ld\n", largest);
}
