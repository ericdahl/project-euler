package main

import "fmt"

func main() {
    sum := 0
    for i, j := 1, 2; i < 4000000; i, j = j, j + i {
        if i % 2 == 0 {
            sum += i
        }
    }
    fmt.Println(sum)
}

