package main

import (
    "fmt"
    "strconv"
)

func main() {
    sum := int64(0)
    for i := int64(0); i < 1e6; i++ {
        if palindrome(strconv.FormatInt(i, 10)) && palindrome(strconv.FormatInt(i, 2)) {
            sum += i
        }
    }
    fmt.Println(sum)
}


func palindrome(s string) (bool) {
    for i, j := 0, len(s) - 1; i < j; i, j = i + 1, j - 1 {
        if s[i] != s[j] {
            return false
        }
    }
    return true
}
