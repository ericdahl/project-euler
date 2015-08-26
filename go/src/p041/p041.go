package main

import (
    "fmt"
    "utils"
)

func main() {

    // 8- and 9- digits aren't possible, e.g., sum(1..9) % 3 == 0
    primes := utils.Primes(7654321)
    for i := len(primes) - 1; i >= 0; i-- {
        if utils.Pandigital(primes[i]) {
            fmt.Println(primes[i])
            break
        }
    }
}
