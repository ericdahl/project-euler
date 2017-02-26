#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <gmp.h>

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

bool pandigital9(long n) {

    if (n < 100000000 || n > 999999999) {
        return false;
    }
    return pandigital(n);
}

bool pandigital(long n) {
    int digits[10] = {1, 0, 0, 0, 0, 0, 0, 0, 0};
    int n_digits = 0;
    for (; n > 0; n /= 10) {
        if (digits[n % 10]) {
            return false;
        }
        n_digits++;
        digits[n % 10]++;
    }

    for (int i = 1; i <= n_digits; i++) {
        if (!digits[i]) {
            return false;
        }
    }
    return true;
}

long concat(int a, int b) {
    int n = 10;
    for (; b >= n; n *= 10);
    return (long) a * (long) n + (long) b;
}


int gcd(int a, int b) {
    int greatest = 1;
    int min = (a < b) ? a : b;
    for (int i = 2; i <= min; ++i) {
        if (a % i == 0 && b % i == 0) {
            greatest = i;
        }
    }
    return greatest;
}

bool is_prime(long n) {
    mpz_t p;
    mpz_init_set_ui(p, n);
    int result = mpz_probab_prime_p(p, 45);
    switch (result) {
        case 2:
            return true;
        case 0:
            return false;
    }
    return true; // FIXME
}


int divisor_sum(int n) {
    int sum = 1;
    int limit = n / 2;
    for (int i = 2; i < limit; ++i) {
        if (n % i == 0) {
            sum += i;
            if (i * i != n) {
                sum += n / i;
            }
            limit = n / i;
        }

    }
    return sum;
}
