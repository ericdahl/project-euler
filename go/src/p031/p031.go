package main

import (
    "fmt"
)

func main() {

    count := 1
    max := 200
    for p100 := 0; p100 <= max / 100; p100++ {
        for p50 := 0; p50 <= max / 50; p50++ {
            for p20 := 0; p20 <= max / 20; p20++ {
                for p10 := 0; p10 <= max / 10; p10++ {
                    for p5 := 0; p5 <= max / 5; p5++ {
                        for p2 := 0; p2 <= max / 2; p2++ {
                            for p1 := 0; p1 <= max / 1; p1++ {
                                if p1 * 1 +
                                   p2 * 2 +
                                   p5 * 5 +
                                   p10 * 10 +
                                   p20 * 20 +
                                   p50 * 50 +
                                   p100 * 100 == max {
                                    count++
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    fmt.Println(count)
}
