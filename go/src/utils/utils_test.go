package utils

import (
    "testing"
    "reflect"
    "math/big"
)

func TestFactors(t *testing.T) {

    cases := []struct {
        in uint64
        want []uint64
    } {
        {12, []uint64{2, 2, 3} },
        {7, []uint64{7} },
    }

    for _, c := range cases {
        got := Factors(c.in)
        if !reflect.DeepEqual(got, c.want) {
            t.Errorf("Factors(%v) == %v, want %v", c.in, got, c.want)
        }
    }
}

func TestFactorial(t *testing.T) {

    cases := []struct {
        in uint
        want *big.Int
    } {
        {0, big.NewInt(1) },
        {1, big.NewInt(1) },
        {2, big.NewInt(2) },
        {3, big.NewInt(6) },
        {4, big.NewInt(24) },
    }

    for _, c := range cases {
        got := Factorial(c.in)
        if c.want.Cmp(got) != 0 {
            t.Errorf("Factorial(%v) == %v, want %v", c.in, got, c.want)
        }
    }
}

func TestDivisors(t *testing.T) {

    cases := []struct {
        in uint64
        want []uint64
    } {
        {12, []uint64 {1, 12, 2, 6, 3, 4}},
        {7, []uint64 {1, 7} },
        {196, []uint64 {1, 196, 2, 98, 4, 49, 7, 28, 14} },
    }

    for _, c := range cases {
        got := Divisors(c.in)
        if !reflect.DeepEqual(got, c.want) {
            t.Errorf("Divisors(%v) == %v, want %v", c.in, got, c.want)
        }
    }
}

func TestPrimes(t *testing.T) {

    cases := []struct {
        in uint64
        want []uint64
    } {
        {1, []uint64 { }},
        {7, []uint64 {2, 3, 5, 7}},
        {10, []uint64 {2, 3, 5, 7}},
        {30, []uint64 {2, 3, 5, 7, 11, 13, 17, 19, 23, 29}},
    }

    for _, c := range cases {
        got := Primes(c.in)
        if !reflect.DeepEqual(got, c.want) {
            t.Errorf("Primes(%v) == %v, want %v", c.in, got, c.want)
        }
    }
}
