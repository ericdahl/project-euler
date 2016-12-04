#include <stdio.h>

int main(int argc, char** argv) {

    long n = 600851475143;
    long i = 3;
    for (; n > 1; ++i) {
        while (n % i == 0) {
            n /= i;
        }
    }
    printf("%ld\n", --i);
}
