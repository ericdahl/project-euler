package main

import "fmt"

func main() {
    factors := Factors(600851475143)
    fmt.Println(factors[len(factors) - 1])
}

