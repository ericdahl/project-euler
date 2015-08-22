package main

import (
    "fmt"
    "strconv"
    "utils"
)

func main() {

    primes := make(map[string]uint64)
    for _, p := range utils.Primes(1000000) {
        primes[strconv.FormatUint(p, 10)] = p
    }

    sum := uint64(0)
    for primeString, prime := range primes {
        if truncatable(primeString, primes) {
            sum += prime
        }
    }

    fmt.Println(sum)
}

func truncatable(p string, primes map[string]uint64) (bool) {
    if len(p) == 1 {
        return false
    }
    for i := 1; i < len(p); i++ {
        if primes[p[i:]] == 0 || primes[p[:i]] == 0 {
            return false
        }
    }
    return true
}
