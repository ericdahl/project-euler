package main

import "fmt"

func main() {
    max := 0
    for i := 100; i < 1000; i++ {
        for j := 100; j < 1000; j++ {
            if i * j == reverse(i * j) {
                if i * j > max {
                    max = i * j
                }
            }
        }
    }
    fmt.Println(max)
}

func reverse(n int) (int) {
    result := 0
    for ; n > 0 ; n /= 10 {
        result *= 10
        result += n % 10
    }
    return result
}

