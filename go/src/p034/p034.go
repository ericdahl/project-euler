package main

import (
    "fmt"
)

func main() {

    m := make(map[int]int)
    m[0] = 1
    for i := 1; i < 10; i++ {
        m[i] = m[i - 1] * i
    }

    sum := 0
    for i := 3; i < 100000; i++ {
        digitSum := 0
        for d := i; d > 0; d /= 10 {
            digitSum += m[d % 10]
        }

        if digitSum == i {
            sum += i
        }
    }

    fmt.Println(sum)
}
