package main

import (
    "fmt"
    "utils"
)

func main() {
    primes := make(map[uint64]bool)
    for _, p := range utils.Primes(10000) {
        primes[p] = true
    }

    for p, _ := range primes {
        for i := uint64(1); p + i + i < 10000; i++ {
            if p == 1487 {
                continue
            }
            if primes[p + i] && primes[p + i + i] && sameDigits(p, p + i) && sameDigits(p, p + i + i) {
                fmt.Printf("%v%v%v\n", p, p + i, p + i + i)
                return
            }
        }
    }
}

func sameDigits(a, b uint64) (bool) {
    digits := make([]uint64, 10)

    for ; a > 0; a /= 10 {
        digits[a % 10]++
    }

    for ; b > 0; b /= 10 {
        digit := b % 10
        if digits[digit] <= 0 {
            return false
        } else {
            digits[digit]--
        }
    }

    return true
}
