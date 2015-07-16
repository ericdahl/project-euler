package main

import (
    "fmt"
    "utils"
    "math/big"
)

func main() {
    sum := big.NewInt(0)
    zero := big.NewInt(0)
    ten := big.NewInt(10)
    for i := utils.Factorial(100); i.Cmp(zero) > 0; i.Quo(i, ten) {
        sum.Add(sum, big.NewInt(0).Rem(i, ten))
    }
    fmt.Println(sum)
}
