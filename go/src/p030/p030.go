package main

import (
    "fmt"
)

func main() {

    m := make(map[int]int)
    for i := 0; i < 10; i++ {
        m[i] = i * i * i * i * i
    }

    total := 0
    for i := 2; i < 1700000; i++ {
        if i == f(i, m) {
            total += i
        }
    }
    fmt.Println(total)
}

func f(n int, m map[int]int) (int) {
    sum := 0
    for ; n > 0; n /= 10 {
        sum += m[n % 10]
    }
    return sum
}

