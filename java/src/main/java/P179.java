import java.util.stream.IntStream;

@SuppressWarnings("unused")
public class P179 implements Puzzle {

    final int limit = 10_000_000;

    @Override
    public String solve() {

        int divisors[] = new int[limit + 1];

        IntStream.range(1, limit + 1)
                .parallel()
                .forEach(i -> divisors[i] = (int) Util.divisors(i).count());

        int count = 0;
        for (int i = 2; i < limit; i++) {
            if (divisors[i] == divisors[i + 1]) {
                count++;
            }
        }

        return "" + count;
    }
}