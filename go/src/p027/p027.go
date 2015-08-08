package main

import (
    "fmt"
    "utils"
)

func main() {
    primes := make(map[int](bool))
    for _, p := range utils.Primes(10000) {
        primes[int(p)] = true
    }

    maxProduct := 0
    for a, maxLength := -999, 0; a < 1000; a++ {
        for b := -999; b < 1000; b++ {
            res := numPrimes(primes, a, b)
            if res > maxLength {
                maxLength = res
                maxProduct = a * b
            }
        }
    }
    fmt.Println(maxProduct)
}

func numPrimes(primes map[int]bool, a, b int) (int) {
    for n := 0; ; n++ {
        if !primes[f(n, a, b)] {
            return n
        }
    }
}

func f(n, a, b int) (int) {
    return n * n + a * n + b;
}
