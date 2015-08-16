package main

import (
    "fmt"
    "utils"
)

func main() {
    primes := utils.Primes(1000000)
    primeMap := make(map[int]bool)
    for _, prime := range primes {
        primeMap[int(prime)] = true
    }

    count := 0
    for _, prime := range primes {
        matches := true
        for _, rotation := range rotations(int(prime)) {
            if !primeMap[rotation] {
                matches = false
                break
            }
        }
        if matches {
            count++
        }
    }
    fmt.Println(count)
}

func rotations(n int) ([]int) {

    results := make([]int, 0)
    d := digits(n)

    for shift := 1; shift < len(d); shift++ {
        rot := append(d[shift:], d[:shift]...)
        res := 0
        for i, mult := len(rot) - 1, 1; i >= 0; i, mult = i - 1, mult * 10 {
           res += rot[i] * mult
        }
        results = append(results, res)
    }
    return results
}

func digits(n int) ([]int) {
    l := make([]int, 0)
    for ; n > 0; n /= 10 {
        l = append([]int{n % 10}, l...)
    }
    return l
}
