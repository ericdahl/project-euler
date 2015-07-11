package main

import (
    "fmt"
    "utils"
)

func main() {
    factors := utils.Factors(600851475143)
    fmt.Println(factors[len(factors) - 1])
}

