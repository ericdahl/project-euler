package main

import "fmt"

func main() {

    m := make(map[int]string)
    m[1] = "one"
    m[2] = "two"
    m[3] = "three"
    m[4] = "four"
    m[5] = "five"
    m[6] = "six"
    m[7] = "seven"
    m[8] = "eight"
    m[9] = "nine"
    m[10] = "ten"
    m[11] = "eleven"
    m[12] = "twelve"
    m[13] = "thirteen"
    m[14] = "fourteen"
    m[15] = "fifteen"
    m[16] = "sixteen"
    m[17] = "seventeen"
    m[18] = "eighteen"
    m[19] = "nineteen"
    m[20] = "twenty"
    m[30] = "thirty"
    m[40] = "forty"
    m[50] = "fivty"
    m[60] = "sixty"
    m[70] = "seventy"
    m[80] = "eighty"
    m[90] = "ninety"
    m[100] = "hundred"
    m[1000] = "thousand"

    count := 0
    for i := 1; i <= 1000; i++ {
       count += len(word(m, i))
    }
    fmt.Println(count)
}


func word(m map[int]string, n int) (string) {
    if n <= 20 {
        return m[n]
    } else if n % 10 == 0 && n <= 90 {
        return m[n]
    } else if n % 1000 == 0 {
        return fmt.Sprint(m[n / 1000], m[1000])
    } else if n % 100 == 0 {
        return fmt.Sprint(m[n / 100], m[100])
    } else if n >= 100 {
        return fmt.Sprint(m[n / 100], m[100], "and", word(m, n % 100))
    } else {
        return fmt.Sprint(word(m, n / 10 * 10), m[n % 10])
    }
}
