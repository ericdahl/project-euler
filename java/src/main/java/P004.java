@SuppressWarnings("unused")
public class P004 implements Puzzle {
    @Override
    public String solve() {

        long max = Long.MIN_VALUE;
        for (int i = 100; i < 1000; i++) {
            for (int j = i; j < 1000; j++) {
                if (Util.reverse(i * j) == i * j) {
                    max = Math.max(i * j, max);
                }
            }
        }
        return "" + max;
    }
}