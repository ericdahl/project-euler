package main

import "fmt"

func main() {
    max := 0
    maxLength := 0
    for n := 1; n < 1000000; n++ {
        len := length(n)
        if len > maxLength {
            maxLength = len
            max = n
        }
    }
    fmt.Println(max)
}

func length(n int) (int) {
    len := 1

    for nn := uint64(n) ; nn != 1; len++ {
        if nn % 2 == 0 {
            nn /= 2
        } else {
            nn = 3 * nn + 1
        }
    }
    return len
}

