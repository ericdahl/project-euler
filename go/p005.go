package main

import "fmt"

func main() {
    incr := 2 * 3 * 5 * 7 * 11 * 13 * 17 * 19
    i := incr
    for ; !divisible(i) ; i += incr { }
    fmt.Println(i)
}

func divisible(n int) (bool) {
    for i := 20; i > 0; i-- {
        if n % i != 0 {
            return false
        }
    }
    return true
}

