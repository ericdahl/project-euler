package utils

import (
    "math/big"
)

func Factors(n uint64) ([]uint64) {
    factors := make([]uint64, 0, 2)

    for i := uint64(2); n > 1; {
        if n % i == 0 {
            factors = append(factors, i)
            n /= i
        } else {
            i++
        }
    }

    return factors
}

func Primes(n uint64) ([]uint64) {
    composites := make([]bool, n + 1)
    composites[0] = true
    composites[1] = true

    for i := uint64(2); i <= n; {
        for j := i * 2; j <= n; j += i {
            composites[j] = true
        }
        for i++ ; i < n && composites[i]; i++ {}
    }

    primes := make([]uint64, 0)

    for i := uint64(2); i <= n; i++ {
        if !composites[i] {
            primes = append(primes, i)
        }
    }

    return primes
}


func Factorial(n uint) (*big.Int) {
    result := big.NewInt(1)
    one := big.NewInt(1)

    for i := big.NewInt(int64(n)); i.Cmp(one) > 0; i.Sub(i, one) {
        result.Mul(result, i)
    }
    return result
}



func Divisors(n uint64) ([]uint64) {
    divisors := make([]uint64, 0, 2)
    for i := uint64(1); i * i < n; i++ {
        if n % i == 0 {
            divisors = append(divisors, i)
            divisors = append(divisors, n / i)
        }
    }
    return divisors
}
