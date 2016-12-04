#include <stdbool.h>

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
