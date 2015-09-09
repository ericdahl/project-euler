package main

import (
    "fmt"
    "strings"
    "github.com/fighterlyt/permutation"
)

func main() {

    p, _ := permutation.NewPerm([]string{"0", "1","2","3","4","5","6","7","8","9"}, nil)
    perm, err := p.Next()
    for count := 0; err == nil && count < 1e6 - 1; perm, err = p.Next() {
        count++
    }

    fmt.Println(strings.Join(perm.([]string), ""))
}
