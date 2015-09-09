package main

import (
    "fmt"
    "utils"
)

func main() {
    primes := utils.Primes(1e6)
    primeMap := make(map[uint64]bool)
    for _, p := range primes {
        primeMap[p] = true
    }

    maxSum := uint64(0)
    maxLength := 0
    for i := 0; i < len(primes); i++ {
        for j, sum := i + 1, primes[i]; j < len(primes) && sum < 1e6; j, sum = j + 1, sum + primes[j] {
            if primeMap[sum] && j - i > maxLength {
                maxSum, maxLength = sum, j - i
            }
        }
    }
    fmt.Println(maxSum)
}
