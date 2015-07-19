package main

import (
    "fmt"
    "utils"
)

func main() {
    sum := 0
    for a := 2; a < 10000; a++ {
        b := d(a)
        if a != b && a == d(b) {
            sum += a
        }
    }
    fmt.Println(sum)
}

func d(n int) int {
    sum := -n
    for _, i := range(utils.Divisors(uint64(n))) {
        sum += int(i)
    }
    return sum
}
