package main

import (
    "fmt"
    "math"
)

func main() {
    maxP := 120
    maxSolutions := 0

    for p := 1; p <= 1000; p++ {
        res := f(p)
        if res > maxSolutions {
            maxSolutions = res
            maxP = p
        }
    }
    fmt.Println(maxP)
}


func f(n int) (int) {
    solutions := 0

    for a := 1; a < n / 2; a++ {
        for b := a; b < n / 2; b++ {
            c := math.Sqrt(float64(a * a + b * b))
            p := a + b + int(c)
            if p > n {
                break
            }
            if p == n && c == math.Trunc(c) {
                solutions++
            }
        }
    }
    return solutions
}
