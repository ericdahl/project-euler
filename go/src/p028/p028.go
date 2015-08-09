package main

import (
    "fmt"
)

func main() {
    fmt.Println(sum(1001))
}

func sum(n int) (int) {
    total := 1
    for delta, curr := 2, 2; delta < n; delta += 2 {
        for i := curr + delta; i < curr + delta * 5; i += delta {
            total += i - 1
        }
        curr += delta * 4
    }
    return total
}
