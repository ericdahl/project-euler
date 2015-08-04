package main

import (
    "fmt"
    "math/big"
)

func main() {
    term := 1
    for i, j := big.NewInt(1), big.NewInt(1); len(i.String()) < 1000; term++ {
        j.Add(j, i)
        i.Sub(j, i)
    }
    fmt.Println(term)
}
