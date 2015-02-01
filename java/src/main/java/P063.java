import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

@SuppressWarnings("unused")
public class P063 implements Puzzle {
    @Override
    public String solve() {
        return "" + IntStream.range(1, 50)
                .parallel()
                .map(i -> count(i))
                .sum();
    }

    private static int count(int exponent) {
        int count = 0;

        final BigInteger min = BigInteger.TEN.pow(exponent - 1);
        final BigInteger max = BigInteger.TEN.pow(exponent);

        for (BigInteger base = BigInteger.ZERO; ; base = base.add(BigInteger.ONE)) {
            BigInteger result = base.pow(exponent);
            if (result.compareTo(min) >= 0) {
                if (result.compareTo(max) < 0) {
                    ++count;
                } else {
                    break;
                }
            }
        }
        return count;
    }

}