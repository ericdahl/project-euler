package main

import (
    "fmt"
)

func main() {

    year := 1900
    month := 1
    date := 1
    day := 0

    count := 0
    for ; year < 2001 ; {
        if year >= 1901 && day == 6 && date == 1 {
            count++
        }

        date++
        day = (day + 1) % 7
        if (nextMonth(year, month, date)) {
            date = 1
            month++
        }

        if month == 13 {
            month = 1
            year++
        }
    }
    fmt.Println(count)
}

func nextMonth(year, month, date int) (bool) {
    switch month {
        case 9, 4, 6, 11:
            return date == 31
        case 2:
            if leapYear(year) {
                return date == 30
            } else {
                return date == 29
            }

    }
    return date == 32
}

func leapYear(year int) (bool) {
    if year % 400 == 0 {
        return true
    }
    return year % 4 == 0
}

