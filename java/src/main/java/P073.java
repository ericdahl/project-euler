import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.LongStream;

@SuppressWarnings("unused")
public class P073 implements Puzzle {



    @Override
    public String solve() {
        final BitSet primesBits = Util.primesBits(12_000);

        final Map<Integer, Set<Integer>> factors = IntStream.range(1, 12_001)
                .boxed()
                .collect(Collectors.toMap(i -> i,
                                          i -> Util.uniqueFactors(i, primesBits).mapToInt(integer -> (int) integer).boxed().collect(Collectors.toSet())));

        return "" + IntStream.range(2, 12_001)
                .parallel()
                .map(denominator ->
                {
                    int count = 0;
                    for (int numerator = denominator / 3 + 1; numerator < (denominator - 1) / 2 + 1; ++numerator) {
                        double result = 1.0 * numerator / denominator;
                        if (result > 1.0 / 3.0 && result < 1.0 / 2.0 &&
                                Collections.disjoint(factors.get(numerator), factors.get(denominator))) {
                            ++count;
                        }
                    }
                    return count;
                })
                .sum();
    }
}