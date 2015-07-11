package main

import "fmt"

func main() {

    for i, n := 1, 1; ; i, n = i + 1, n + i + 1 {
        if n % 2 == 1 {
            continue
        }

        if divisors(n) > 500 {
            fmt.Println(n)
            break
        }
    }
}

func divisors(n int) (int) {
    count := 0
    for i := 1; i * i < n; i++ {
        if n % i == 0 {
            count += 2
        }
    }
    return count
}
