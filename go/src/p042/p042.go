package main

import (
    "fmt"
    "log"
    "os"
    "bufio"
    "strings"
)

func main() {

    file, err := os.Open("../resources/p042_words.txt")
    if err != nil {
        log.Fatal(err)
    }
    defer file.Close()

    t := triangles(20)
    scanner := bufio.NewScanner(file)
    total := 0

    for scanner.Scan() {
        words := strings.Split(strings.Replace(scanner.Text(), "\"", "", -1), ",")
        for _, word := range words {
            if t[f(word)] {
                total++
            }
        }
    }
    if err := scanner.Err(); err != nil {
        log.Fatal(err)
    }

    fmt.Println(total)
}

func triangles(n int) (map[int](bool)) {
    m := make(map[int](bool))

    for i := 1; i <= n; i++ {
        m[i * (i + 1) / 2] = true
    }

    return m
}

func f(s string) (int) {
    total := 0
    for _, c := range s {
        total += int(c - 'A') + 1
    }
    return total
}
