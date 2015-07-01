package main

import "fmt"

func main() {
    sum := uint64(0)
    for _, i := range Primes(2000000) {
        sum += i
    }
    fmt.Println(sum)
}

