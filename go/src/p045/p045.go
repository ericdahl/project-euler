package main

import (
    "fmt"
)

func main() {

    t := make(map[uint64]bool)
    p := make(map[uint64]bool)
    h := make(map[uint64]bool)

    for n := uint64(1); n < 500000; n++ {
        t[n * (n + 1) / 2] = true
        p[n * (3 * n - 1) / 2] = true
        h[n * (2 * n - 1)] = true
    }

    for n, _ := range(t) {
        if n > 40755 && p[n] && h[n] {
            fmt.Println(n)
        }
    }
}


