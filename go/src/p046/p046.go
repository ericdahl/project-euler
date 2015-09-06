package main

import (
    "fmt"
    "utils"
)

func main() {

    primes, maxPrime := primeMap(10000)
    results := make(map[int]bool)
    for p, _ := range primes {
        for ts := 1; ts < 100; ts++ {
            results[p + 2 * ts * ts] = true
        }
    }

    for c := 9; c < maxPrime; c += 2 {
        if !primes[c] && !results[c] {
            fmt.Println(c)
            break
        }
    }
}

func primeMap(n uint64) (map[int]bool, int) {
    primes := make(map[int]bool)
    maxPrime := 0
    for _, p := range utils.Primes(n) {
        primes[int(p)] = true
        maxPrime = int(p)
    }

    return primes, maxPrime
}
