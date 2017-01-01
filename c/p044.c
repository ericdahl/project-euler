#include <stdio.h>
#include <stdlib.h>

#include <glib.h>

static const int LIMIT = 2500;

static int p(const int n);

int main(int argc, char** argv) {

    int pvalues[LIMIT + 1];
    pvalues[LIMIT] = 0;

    GHashTable* const ptable = g_hash_table_new(g_int_hash, g_int_equal);

    for (int i = 1; i < LIMIT; ++i) {
        pvalues[i] = p(i);
        g_hash_table_insert(ptable, pvalues + i, pvalues + i);
    }

    for (int* j = pvalues + 1; *j; ++j) {
        for (int* k = j + 1; *k; ++k) {
            const int sum = *j + *k;
            const int diff = *k - *j;
            if (g_hash_table_lookup(ptable, &sum) && g_hash_table_lookup(ptable, &diff)) {
                printf("%d\n", diff);
                exit(EXIT_SUCCESS);
            }
        }
    }
}

static int p(const int n) {
    return n * (3 * n - 1) / 2;
}
