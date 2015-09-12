package main

import (
    "fmt"
    "utils"
    "strconv"
)

func main() {
    matches := make(map[int]bool)

    for a := 1; a <= 1000; a++ {
        for b := 4000 / a; ; b++ {
            s := strconv.Itoa(a) + strconv.Itoa(b) + strconv.Itoa(a * b)
            if len(s) > 9 {
                break
            }
            if utils.PandigitalString(s) {
                matches[a * b] = true
            }
        }
    }

    sum := 0
    for product, _ := range matches {
        sum += product
    }
    fmt.Println(sum)
}
