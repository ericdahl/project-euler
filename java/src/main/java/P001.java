import java.util.stream.IntStream;

@SuppressWarnings("unused")
public class P001 implements Puzzle {
    @Override
    public String solve() {
        return "" + IntStream.range(1, 1000)
                .filter(i -> i % 3 == 0 || i % 5 == 0)
                .sum();
    }
}