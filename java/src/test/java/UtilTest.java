import org.junit.Test;

import java.util.BitSet;
import java.util.stream.Collectors;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.contains;
import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.is;

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
}
