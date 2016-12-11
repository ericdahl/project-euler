#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#include "util.h"

long reverse(long n) {
    long reverse = 0;
    
    for (; n > 0; n /= 10) {
        reverse *= 10;
        reverse += n % 10;
    }

    return reverse;
}

bool palindrome(long n) {
    return n == reverse(n);
}

int* generate_primes(int n) {
    bool* prime_array = generate_prime_array(n); 

    int count = 0;
    for (int i = 2; i < n; i++) {
        if (prime_array[i]) {
            ++count;
        }
    }

    int* primes = malloc(count * sizeof(int) + 1);
    primes[count] = 0; // end of prime indicator
    
    for (int i = 2, position = 0; i < n; ++i) {
        if (prime_array[i]) {
            primes[position++]  = i;
        }
    }

    free(prime_array);
    return primes;
}

bool* generate_prime_array(int n) {
    bool* candidates = malloc(n * sizeof(bool));
    memset(candidates, true, n); // assumes bool is 1 byte

    for (int i = 2; i * i < n; ) {
        for (int j = i + i; j < n; j += i) {
            candidates[j] = false;
        }

        for (++i; !candidates[i]  && i * i < n; ++i);
    }
    
    return candidates;
}
