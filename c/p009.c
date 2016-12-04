#include <stdio.h>

int main(int argc, char** argv) {
    for (int a = 1; a < 1000 / 3; a++) {
        for (int b = a + 1; b < 1000 / 2; b++) {
            const int c = 1000 - a - b;
            
            if (a * a + b * b == c * c) {
                printf("%d\n", (a * b * c));
            }
        }
    }
}
