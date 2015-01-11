import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;

@SuppressWarnings("unused")
public class P076 implements Puzzle {

    private Map<Long, BigInteger> resultsCache = new HashMap<>();

    @Override
    public String solve() {
        resultsCache.put(0L, BigInteger.ONE);

        return "" + p(100).subtract(BigInteger.ONE);
    }

    // see http://en.wikipedia.org/wiki/Partition_function_%28mathematics%29
    private BigInteger p(long n) {
        if (resultsCache.containsKey(n)) {
            return resultsCache.get(n);
        }

        BigInteger s = BigInteger.ZERO;
        long k = 2;
        for (long j = n - 1; j >= 0; ) {
            BigInteger t = p(j);

            s = s.add(((k / 2) % 2 == 1) ? t : t.negate());
            j -= (k % 2 == 1) ? k : k / 2;
            k += 1;
        }
        resultsCache.put(n, s);
        return s;
    }
}