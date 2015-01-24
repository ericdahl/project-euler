import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@SuppressWarnings("unused")
public class P074 implements Puzzle {


    @Override
    public String solve() {
        final Map<Integer, Integer> factorialMap = IntStream.range(0, 10)
                .boxed()
                .collect(Collectors.toMap(k -> k,
                                          v -> IntStream.range(1, v + 1).reduce(1, (a, b) -> a * b)));

        return "" + IntStream.range(1, 1_000_000)
                .parallel()
                .filter(i -> length(factorialMap, i, 60))
                .count();
    }


    private static boolean length(Map<Integer, Integer> factorialMap, int n, final int targetLength) {
        Set<Integer> seen = new HashSet<>(Arrays.asList(n));

        for (int length = 1; ; ++length) {
            n = factorialSum(factorialMap, n);

            if (length > targetLength) {
                return false;
            }
            if (seen.contains(n)) {
                return length == targetLength;
            }

            seen.add(n);
        }
    }

    private static int factorialSum(Map<Integer, Integer> factorialMap, int n) {
        int sum = 0;
        for (; n > 0; n /= 10) {
            sum += factorialMap.get(n % 10);
        }

        return sum;
    }
}