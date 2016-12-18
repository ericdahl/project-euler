#include <stdio.h>
#include <string.h>

#include "util.h"

static const int LIMIT = 1000;

int main(int argc, char** argv) {

    int p_solutions[LIMIT + 1];
    memset(p_solutions, 0, 1001 * sizeof(int));
    for (int a = 1; a < LIMIT / 3; ++a) {
        for (int b = a; b < LIMIT / 2; ++b) {
            for (int c = b; c < LIMIT - a - b; ++c) {
                if (a * a + b * b == c * c) {
                    p_solutions[a + b + c]++;
                }
            }
        }
    }
    int max_solutions = 0;
    int max_solutions_p = 0;
    for (int i = 0; i <= LIMIT; ++i) {
        if (p_solutions[i] > max_solutions) {
            max_solutions = p_solutions[i];
            max_solutions_p = i;
        }
    }
    printf("%d\n", max_solutions_p);
}

