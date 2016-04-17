import org.junit.Test;

import java.util.BitSet;
import java.util.stream.Collectors;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;

public class UtilTest {

    @Test
    public void shouldCalcPrimes() {
        assertThat(Util.primes(100), hasSize(25));
        assertThat(Util.primes(1_000), hasSize(168));
    }

    @Test
    public void shouldCalcFactors() {
        BitSet primesBits = Util.primesBits(100);
        assertThat(Util.uniqueFactors(12, primesBits).boxed().collect(Collectors.toList()), contains(2L, 3L));
        assertThat(Util.uniqueFactors(7, primesBits).boxed().collect(Collectors.toList()), contains(7L));
        assertThat(Util.uniqueFactors(80, primesBits).boxed().collect(Collectors.toList()), contains(2L, 5L));
    }

    @Test(expected = RuntimeException.class)
    public void shouldErrorIfNotEnoughFactors() throws Exception {
        BitSet primesBits = Util.primesBits(10);
        Util.uniqueFactors(12345, primesBits).boxed().collect(Collectors.toList());
    }

    @Test
    public void shouldReverse() {
        assertThat(Util.reverse(1234L), is(4321L));
        assertThat(Util.reverse(0L), is(0L));
        assertThat(Util.reverse(7L), is(7L));
        assertThat(Util.reverse(933L), is(339L));
    }

    @Test
    public void shouldGetDivisors() {
        assertThat(Util.divisors(4).boxed().collect(Collectors.toList()), hasItems(1, 2, 4));
        assertThat(Util.divisors(14).boxed().collect(Collectors.toList()), hasItems(1, 2, 7, 14));
        assertThat(Util.divisors(15).boxed().collect(Collectors.toList()), hasItems(1, 3, 5, 15));
        assertThat(Util.divisors(7).boxed().collect(Collectors.toList()), hasItems(1, 7));
        assertThat(Util.divisors(1).boxed().collect(Collectors.toList()), hasItems(1));
    }
}
