package utils

import "testing"
import "reflect"

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
