#include <stdio.h>
#include <stdlib.h>

#include "util.h"

int main(int argc, char** argv) {

    int digits[10];
    for (int i = 0; i < 10; ++i) {
        digits[i] = i * i * i * i * i;
    }

    int sum = 0;
    for (int i = 1000; i < 1000000; ++i) {
        int total = 0;
        for (int n = i; n > 0; n /= 10) {
            total += digits[n % 10];
        }
        if (total == i) {
            sum += total;
        }
    }

    printf("%d\n", sum);
}
