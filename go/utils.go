package main


func Factors(n uint64) ([]uint64) {
    factors := make([]uint64, 0, 2)

    for i := uint64(2); n > 1; {
        if n % i == 0 {
            factors = append(factors, i)
            n /= i
        } else {
            i++
        }
    }

    return factors
}


