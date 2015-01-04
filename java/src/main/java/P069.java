import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@SuppressWarnings("unused")
public class P069 implements Puzzle {
    @Override
    public String solve() {

        // FIXME: slow (~11 hours)

        final int max = 1000001;

        Map<Integer, Set<Integer>> divisors = IntStream.range(2, max)
                .boxed()
                .collect(Collectors.toMap(k -> k, v -> divisors(v).boxed().collect(Collectors.toSet())));

        List<Double> results = IntStream.range(2, max)
                .parallel()
                .boxed()
                .map(i -> g(divisors, i))
                .collect(Collectors.toList());

        final int index = 2 + results.indexOf(results.stream()
                .max(Comparator.<Double>naturalOrder())
                .orElseThrow(() -> new IllegalArgumentException("failure")));

        return "" + index;
    }

    private static double g(Map<Integer, Set<Integer>> divisors, int n) {
        return (double) n / phi(divisors, n);
    }

    private static int phi(Map<Integer, Set<Integer>> divisors, int a) {
        return 1 + (int) IntStream.range(2, a)
                .filter(i -> relativePrime(divisors, a, i))
                .count();
    }

    private static boolean relativePrime(Map<Integer, Set<Integer>> divisors, int a, int b) {
        return Collections.disjoint(divisors.get(a), divisors.get(b));
    }

    private static IntStream divisors(int n) {
        return IntStream.range(2, n + 1)
                .parallel()
                .filter(i -> n % i == 0);
    }
}