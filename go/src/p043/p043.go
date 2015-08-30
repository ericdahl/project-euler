package main

import (
    "fmt"
    "github.com/fighterlyt/permutation"
)

func main() {
    i := []int{1,2,3,4,5,6,7,8,9,0}
    p, _ := permutation.NewPerm(i,nil)
    sum := uint64(0)
    for i, err := p.Next(); err==nil; i, err = p.Next() {
        digits := i.([]int)
        if (match(digits)) {
            sum += concat(digits)
        }
    }
    fmt.Println(sum)
}

func match(digits []int) (bool) {
    if concat(digits[1:4]) % 2 == 0 &&
       concat(digits[2:5]) % 3 == 0 &&
       concat(digits[3:6]) % 5 == 0 &&
       concat(digits[4:7]) % 7 == 0 &&
       concat(digits[5:8]) % 11 == 0 &&
       concat(digits[6:9]) % 13 == 0 &&
       concat(digits[7:10]) % 17 == 0 {
        return true
    }
    return false
}

func concat(values []int) (uint64) {
    total := uint64(0)
    for i, multiplier := len(values) - 1, 1; i >= 0; i, multiplier = i - 1, multiplier * 10 {
        total += uint64(values[i] * multiplier)
    }
    return total
}
