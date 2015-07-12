package main

import (
    "fmt"
    "math/big"
)

func main() {
    const n = 20
    numer := big.NewInt(0).MulRange(1, 2 * n)
    denom := big.NewInt(0).MulRange(1, n)
    denom.Mul(denom, denom)

    fmt.Println(numer.Quo(numer, denom))
}

