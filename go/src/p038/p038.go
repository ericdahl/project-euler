package main

import (
    "fmt"
    "strconv"
)

func main() {
    max := ""
    for i := 1; i < 10000; i++ {
        result := concat(i)
        if result > max && pandigital(result) {
            max = result
        }
    }
    fmt.Println(max)
}

func concat(n int) (string) {
    result := ""
    for i := 1; len(result) < 9; i++ {
        result += strconv.Itoa(n * i)
    }
    return result
}

func pandigital(n string) (bool) {
    if len(n) != 9 {
        return false
    }
    m := make(map[rune]bool)
    for _, c := range n {
        if c == '0' || m[c] {
            return false
        }
        m[c] = true
    }
    return true
}
