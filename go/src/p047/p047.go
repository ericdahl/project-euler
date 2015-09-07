package main

import (
    "fmt"
    "utils"
)

func main() {
    primes := utils.Primes(1000)

    for i := uint64(2); ; i++ {
        if len(utils.DistinctFactors(i, primes)) == 4 &&
           len(utils.DistinctFactors(i + 1, primes)) == 4 &&
           len(utils.DistinctFactors(i + 2, primes)) == 4 &&
           len(utils.DistinctFactors(i + 3, primes)) == 4 {
            fmt.Println(i)
            break
        }
    }
}
