#include <stdio.h>
#include <stdbool.h>

int main(int argc, char** argv) {

    long sum_squares = 0;
    long sum = 0;

    for (long i = 1; i <= 100; ++i) {
        sum_squares += i * i;
        sum += i;
    }

    printf("%ld\n", (sum * sum - sum_squares));
}
