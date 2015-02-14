import java.util.*;

@SuppressWarnings("unused")
public class P058 implements Puzzle {

    @Override
    public String solve() {
        final BitSet primes = Util.primesBits(1_000_000_000);

        int n = 1;
        int primeCount = 0;

        for (int i = 0; ; ++i) {
            final int inc = (i / 4 + 1) * 2;
            final double primeRatio = (double) primeCount / (i + 1);

            if (primeRatio < 0.1 && inc > 3 && i % 4 == 0) {
                return "" + (inc - 1);
            }
            if (primes.get(n)) {
                ++primeCount;
            }
            n += inc;
        }
    }
}