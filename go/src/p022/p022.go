package main

import (
    "fmt"
    "log"
    "os"
    "bufio"
    "strings"
    "sort"
)

func main() {

    file, err := os.Open("../resources/p022_names.txt")
    if err != nil {
        log.Fatal(err)
    }
    defer file.Close()

    scanner := bufio.NewScanner(file)
    total := 0
    for scanner.Scan() {
        names := strings.Split(strings.Replace(scanner.Text(), "\"", "", -1), ",")
        sort.Strings(names)

        for i, name := range names {
            total += (i + 1) * score(name)
        }
    }
    if err := scanner.Err(); err != nil {
        log.Fatal(err)
    }

    fmt.Println(total)
}

func score(name string) (int) {
    total := 0
    for _, c := range name {
        total += int(c - 'A' + 1)
    }
    return total;
}
