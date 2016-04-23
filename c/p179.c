#include <stdio.h>

int divisors(const int n);

int main(int argc, char** argv) {
    const int limit = 10000000;
    int last = 0;
    int count = 0;
    for (int i = 2; i <= limit; ++i) {
        const int d = divisors(i);
        if (d == last) {
            ++count;
        }
        last = d;
    }
    printf("%d\n", count);
}


int divisors(const int n) {
    int count = 2;
    int d = 2;
    for (; d * d <= n; ++d) {
        if (n % d == 0) {
            count += 2;
        }
    }
    --d;
    if (d * d == n) {
        --count;
    }

    return count;
}

