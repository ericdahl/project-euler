package main

import (
    "fmt"
    "math/big"
)

func main() {
    one := big.NewInt(1)
    max := big.NewInt(100)
    m := make(map[string]bool)

    for a := big.NewInt(2); a.Cmp(max) <= 0; a.Add(a, one) {
        for b := big.NewInt(2); b.Cmp(max) <= 0; b.Add(b, one) {
            m[big.NewInt(0).Exp(a, b, nil).String()] = true
        }
    }

    fmt.Println(len(m))
}

