package main

import (
    "fmt"
    "utils"
    "strconv"
)

func main() {
    max := ""
    for i := 1; i < 10000; i++ {
        result := concat(i)
        if result > max && utils.PandigitalString(result) {
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
