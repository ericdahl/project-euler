#include <stdio.h>
#include <stdbool.h>

static bool divisible(long n);

int main(int argc, char** argv) {
    const long incr = 2 * 3 * 5 * 7 * 11 * 13 * 17 * 19;
    long n = incr;
    for (; !divisible(n); n += incr);
    printf("%ld\n", n);
    
}

static bool divisible(long n) {
    for (int i = 20; i >= 11; i--) {
        if (n % i != 0) {
            return false;
        }
    }
    return true;
}
