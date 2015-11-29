import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.LongStream;

public final class Util {
    private Util() {}

    public static Set<Integer> primes(int n) {

        return primesBits(n).stream()
                .boxed()
                .collect(Collectors.toCollection(() -> new HashSet<>(n)));
    }

    public static BitSet primesBits(int n) {

        BitSet bitSet = new BitSet(n + 1);
        bitSet.set(2, n + 1);

        for (int i = bitSet.nextSetBit(2); i != -1 ; i = bitSet.nextSetBit(i + 1)) {
            for (int j = i * 2; j <= n; j += i) {
                bitSet.clear(j);
            }
        }
        return bitSet;
    }

    public static LongStream uniqueFactors(int n, final BitSet primeBits) {
        if (primeBits.get(n)) {
            return LongStream.of(n);
        }

        final LongStream.Builder builder = LongStream.builder();

        for (int p = 2; n > 1; p = primeBits.nextSetBit(p + 1)) {
            if (p == -1) {
                throw new RuntimeException("not enough primes");
            }

            if (n % p == 0) {
                n /= p;
                while (n % p == 0) {
                    n /= p;
                }
                builder.add(p);
            }
        }

        return builder.build();
    }

    public static long reverse(long n) {
        long result = 0;
        for (; n > 0; n /= 10) {
            result = result * 10 + n % 10;
        }
        return result;
    }
}
