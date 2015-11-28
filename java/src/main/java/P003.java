import java.util.Comparator;

@SuppressWarnings("unused")
public class P003 implements Puzzle {
    @Override
    public String solve() {
        final long TARGET = 600851475143L;

        return "" + Util.primes((int) Math.sqrt(TARGET)).stream()
                .filter(i -> TARGET % i == 0)
                .max(Comparator.naturalOrder())
                .orElseThrow(() -> new IllegalStateException("nothing found"));
    }
}