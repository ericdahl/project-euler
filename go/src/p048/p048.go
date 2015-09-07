package main

import (
    "fmt"
    "math/big"
)

func main() {
    total := big.NewInt(0)
    for i := big.NewInt(1); i.Cmp(big.NewInt(1000)) <= 0; i.Add(i, big.NewInt(1)) {
        total.Add(total, big.NewInt(0).Exp(i, i, nil))
    }

    s := total.String()
    fmt.Println(s[len(s) - 10:])
}
