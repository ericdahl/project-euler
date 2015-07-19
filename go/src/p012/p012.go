package main

import (
    "fmt"
    "utils"
)

func main() {

    for i, n := 1, 1; ; i, n = i + 1, n + i + 1 {
        if n % 2 == 1 {
            continue
        }

        if len(utils.Divisors(uint64(n))) > 500 {
            fmt.Println(n)
            break
        }
    }
}
