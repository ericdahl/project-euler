import java.math.BigInteger;
import java.util.Arrays;
import java.util.Comparator;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@SuppressWarnings("unused")
public class P062 implements Puzzle {
    @Override
    public String solve() {

        final BigInteger collect = IntStream.range(1, 10000)
                .boxed()
                .map(i -> BigInteger.valueOf(i).pow(3))
                .collect(Collectors.groupingBy(i -> {
                    char[] c = i.toString().toCharArray();
                    Arrays.sort(c);
                    return new String(c);
                }))
                .entrySet().stream()
                .filter(e -> e.getValue().size() == 5)
                .flatMap(e -> e.getValue().stream())
                .min(Comparator.naturalOrder())
                .orElse(null);


        return "" + collect;
    }
}