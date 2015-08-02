package main

import (
    "fmt"
    "utils"
)

func main() {
    abundant := make([]uint64, 0)
    for i := uint64(2); i < 28123; i++ {
        if sum(i) > i {
            abundant = append(abundant, i)
        }
    }

    m := make(map[uint64]bool)
    for i := 0; i < len(abundant); i++ {
        for j := i; j < len(abundant); j++ {
            m[abundant[i] + abundant[j]] = true
        }
    }

    sum := uint64(0)
    for i := uint64(1); i <= 28123; i++ {
        if !m[i] {
            sum += i
        }
    }

    fmt.Println(sum)
}

func sum(n uint64) (uint64) {
    s := uint64(0)
    for _, v := range utils.Divisors(n) {
        if v == n {
            continue
        }
        s += v
    }
    return s
}
