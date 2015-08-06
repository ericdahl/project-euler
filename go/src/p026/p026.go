package main

import (
    "fmt"
)

func main() {
    max_i := 2
    max := 0
    for i := 2; i < 1000; i++ {
        res := cycleLength(i)
        if res > max {
            max_i = i
            max = res
        }
    }
    fmt.Println(max_i)
}

func cycleLength(n int) (int) {
    // key is the remainder and value is the position
    // in which that remainder was seen
    m := make(map[int]int)
    for d, i := 1, 1; ; i++ {
        if d == 0 {
            return 0
        } else if d < n {
            d *= 10
            continue
        }
        remainder := d % n
        if m[remainder] > 0 {
            return i - m[remainder]
        }
        m[remainder] = i
        d = remainder
    }
}
