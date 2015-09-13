package main

import (
    "fmt"
    "utils"
    "math"
)

func main() {
    primes := make(map[uint64]bool)
    for _, p := range(utils.Primes(100000000)) {
        primes[p] = true
    }
    sum := uint64(0)
    for p, _ := range(primes) {
        n := p - uint64(1)
        if g(n, primes) {
            sum += n
        }
    }
    fmt.Println(sum)
}

func g(n uint64, primes map[uint64]bool) (bool) {
    if n == 1 {
        return true
    }
    for d := uint64(2); d <= uint64(math.Sqrt(float64(n))) + 1; d++ {
        if n % d == 0 && !primes[d + n / d] {
            return false
        }
    }
    return true
}
