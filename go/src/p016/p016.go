package main

import "fmt"
import "math/big"

func main() {
    zero := big.NewInt(0)
    ten := big.NewInt(10)
    n := new(big.Int).Exp(big.NewInt(2), big.NewInt(1000), nil)

    total := new(big.Int)
    for r := new(big.Int); n.Cmp(zero) > 0; total.Add(total, r) {
        n.QuoRem(n, ten, r)
    }
    fmt.Println(total)
}
