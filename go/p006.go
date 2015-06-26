package main

import "fmt"

func main() {
    sum_squares := 0
    square_sums := 0
    for i := 1; i <= 100; i++ {
        sum_squares += i * i
        square_sums += i
    }
    square_sums *= square_sums
    fmt.Println(square_sums - sum_squares)
}

