#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#include "util.h"

static const int LIMIT = 28124;

static bool* gen_ab_table(const int size, int* n_ab);
static int* gen_ab_list(const int n_ab, const bool* ab_table);
static bool has_ab_sum(const int n, const int* ab_list, const bool* ab_table);

int main(int argc, char** argv) {

    int n_ab;
    const bool* ab_table = gen_ab_table(LIMIT, &n_ab);
    const int* ab_list = gen_ab_list(n_ab, ab_table);

    int sum = 0;
    for (int i = 1; i < LIMIT; ++i) {
        if (!has_ab_sum(i, ab_list, ab_table)) {
            sum += i;
        }
    }
    printf("%d\n", sum);
}

bool* gen_ab_table(const int size, int* n_ab) {
    bool* ab_table = calloc(size, sizeof(bool));
    for (int i = 2; i < size; ++i) {
        ab_table[i] = divisor_sum(i) > i;
        if (ab_table[i]) {
            ++(*n_ab);
        }
    }

    return ab_table;
}

int* gen_ab_list(const int n_ab, const bool* ab_table) {
    int* const ab_list = calloc(n_ab + 1, sizeof(int));
    int* c = ab_list;
    for (int i = 2; i < LIMIT; ++i) {
        if (ab_table[i]) {
            *c++ = i;
        }
    }
    return ab_list;
}

bool has_ab_sum(const int n, const int* ab_list, const bool* ab_table) {
    for (const int* ab = ab_list; *ab && *ab < n; ++ab) {
        if (ab_table[n - *ab]) {
            return true;
        }
    }
    return false;
}

