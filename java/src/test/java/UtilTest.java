import org.junit.Test;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.hasSize;

public class UtilTest {

    @Test
    public void shouldCalcPrimes() {
        assertThat(Util.primes(100), hasSize(25));
        assertThat(Util.primes(1_000), hasSize(168));
    }

}
