import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;

@SuppressWarnings("unused")
public class P078 implements Puzzle {
    @Override
    public String solve() {

        final BigInteger MILLION = BigInteger.valueOf(1000000);

        Map<Long, BigInteger> r = new HashMap<>();
        r.put(0L, BigInteger.ONE);

        for (long i = 1; ; i++) {
            final BigInteger result = p(r, i);
            if (result.mod(MILLION).equals(BigInteger.ZERO)) {
                return "" + i;
            }

            r.put(i, result);
        }
    }

    private BigInteger p(Map<Long, BigInteger> results, long n) {
        if (results.containsKey(n)) {
            return results.get(n);
        }

        BigInteger s = BigInteger.ZERO;
        long k = 2;
        for (long j = n - 1; j >= 0; ) {
            BigInteger t = p(results, j);

            s = s.add(((k / 2) % 2 == 1) ? t : t.negate());
            j -= (k % 2 == 1) ? k : k / 2;
            k += 1;
        }
        return s;
    }
}