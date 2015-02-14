import java.util.*;
import java.util.stream.Collectors;

public final class Util {
    private Util() {}

    public static Set<Integer> primes(int n) {

        BitSet bitSet = new BitSet(n + 1);
        bitSet.set(2, n + 1);

        for (int i = bitSet.nextSetBit(2); i != -1 ; i = bitSet.nextSetBit(i + 1)) {
            for (int j = i * 2; j <= n; j += i) {
                bitSet.clear(j);
            }
        }

        return bitSet.stream()
                .boxed()
                .collect(Collectors.toCollection(() -> new HashSet<>(n)));
    }
}
