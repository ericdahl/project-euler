import java.util.HashSet;
import java.util.Set;

@SuppressWarnings("unused")
public class P125 implements Puzzle {

    final int limit = 100_000_000;

    public String solve() {

        final int limit = 100_000_000;

        long sum = 0;
        final Set<Integer> results = new HashSet<>();

        for (int i = 1; i * i < limit; i++) {
            int candidate = i * i;
            for (int j = i + 1; ; j++) {
                candidate += j * j;
                if (candidate > limit) {
                    break;
                }
                if (candidate == Util.reverse(candidate) && !results.contains(candidate)) {
                    sum += candidate;
                    results.add(candidate);
                }
            }
        }
        return "" + sum;
    }
}