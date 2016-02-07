#include <stdio.h>

int main(int argc, char** argv) {

    int sum = 0;
    for (int i = 1, j = 2; i <= 4000000; ) {
        j = i + j;
        i = j - i;

        if (i % 2 == 0) {
            sum += i;
        }
    }

    printf("%d\n", sum);
}
