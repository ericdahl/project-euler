package main

import (
    "fmt"
)

func main() {

    p := make(map[uint64]bool)
    for n := uint64(1); n < 10000; n++ {
        p[n * (3 * n - 1) / 2] = true
    }

    minD := uint64(1e10)
    for j, _ := range p {
        for k, _ := range p {
            if !p[k + j] {
                continue
            }
            if k > j && p[k - j] && k - j < minD {
                minD = k - j
            }
        }
    }
    fmt.Println(minD)
}


