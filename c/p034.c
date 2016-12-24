#include <stdio.h>

static int digit_fact_sum(int n, const int digits[]);

int main(int argc, char** argv) {

    int digits[10];
    for (int i = 0; i < 10; ++i) {
        digits[i] = 1;
        for (int j = 1; j <= i; ++j) {
            digits[i] *= j;
        }
    }

    int sum = 0;
    for (int i = 3; i < 100000; ++i) {
        if (i == digit_fact_sum(i, digits)) {
            sum += i;
        }
    }
    printf("%d\n", sum);
}

static int digit_fact_sum(int n, const int digits[]) {
    int sum = 0;
    for (; n > 0; n /= 10) {
        sum += digits[n % 10];
    }
    return sum;
}
