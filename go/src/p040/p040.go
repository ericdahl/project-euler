package main

import (
    "fmt"
    "bytes"
    "strconv"
)

func main() {
    buffer := bytes.NewBufferString("")
    for i := 0; buffer.Len() <= 1000000; i++ {
        buffer.WriteString(strconv.Itoa(i))
    }

    s := buffer.String()
    product := 1
    for i := 1; i <= 1000000; i *= 10 {
        product *= int(s[i] - '0')
    }
    fmt.Println(product)
}
