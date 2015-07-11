package main

import (
    "fmt"
    "utils"
)

func main() {
    sum := uint64(0)
    for _, i := range utils.Primes(2000000) {
        sum += i
    }
    fmt.Println(sum)
}

