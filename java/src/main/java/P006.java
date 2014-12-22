import java.util.stream.LongStream;

@SuppressWarnings("unused")
public class P006 implements Puzzle {
    @Override
    public String solve() {
        final long sum = LongStream.range(1, 101)
                .map(i -> i * i)
                .sum();

        long square = LongStream.range(1, 101)
                .sum();
        square *= square;

        return "" + (square - sum);
    }
}