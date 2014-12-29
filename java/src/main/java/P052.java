import java.util.Arrays;
import java.util.stream.IntStream;

@SuppressWarnings("unused")
public class P052 implements Puzzle {
    @Override
    public String solve() {
        return "" + IntStream.range(1, 1000000)
                .filter(i -> same(i, i * 2))
                .filter(i -> same(i * 3, i * 4))
                .filter(i -> same(i * 5, i * 6))
                .filter(i -> same(i, i * 6))
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("no result"));

    }

    private static boolean same(int a, int b) {
        char[] aChars = String.valueOf(a).toCharArray();
        char[] bChars = String.valueOf(b).toCharArray();

        Arrays.sort(aChars);
        Arrays.sort(bChars);
        return Arrays.equals(aChars, bChars);
    }
}