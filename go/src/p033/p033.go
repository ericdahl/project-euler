package main

import (
    "fmt"
    "math/big"
)

func main() {

    result := big.NewRat(1, 1)

    for n := 10; n < 100; n++ {
        for d := n + 1; d < 100; d++ {
           if matches(n, d) {
               result.Mul(result, big.NewRat(int64(n), int64(d)))
           }
        }
    }
    fmt.Println(result.Denom())
}

func matches(n, d int) (bool) {
    n1 := float64(n / 10)
    n2 := float64(n % 10)
    d1 := float64(d / 10)
    d2 := float64(d % 10)

    res := float64(n) / float64(d)

    if n1 == n2 || d1 == d2 {
        return false
    }

    return (n2 == d1 && d2 != 0 && n1 / d2 == res) ||
       (n1 == n2 && n2 / d1 == res)

}
