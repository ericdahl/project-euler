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
