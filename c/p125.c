#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

struct node {
    long value;
    struct node* next;
};

static long reverse(long n);
static bool seen(const struct node const * results, long n);
static void append(struct node** results, long n);

int main(int argc, char** argv) {

    const int limit = 100000000;
    long sum = 0;
    struct node* results = 0;

    for (int i = 1; i * i < limit; i++) {
        int candidate = i * i;
        for (int j = i + 1; ; j++) {
            candidate += j * j;
            if (candidate > limit) {
                break;
            }
            if (candidate == reverse(candidate) && !seen(results, candidate)) {
                sum += candidate;
                append(&results, candidate);
            }
        }
    }

    printf("%ld\n", sum);
    return 0;
}

static long reverse(long n) {
    long result = 0;
    for (; n > 0; n /= 10) {
        result = result * 10 + n % 10;
    }
    return result;
}

static bool seen(const struct node const * results, long n) {
    // inefficient O(N) but could be O(1) if using hash
    for (const struct node* c = results; c; c = c->next) {
        if (n == c->value) {
            return true;
        }
    }
    return false;
}


static void append(struct node** results, long n) {
    struct node* result = calloc(1, sizeof(struct node));
    result->value = n;

    if (!*results) {
        *results = result;
    } else {
        struct node* c = *results;
        for (; c->next; c = c->next);
        c->next = result;
    }
}
