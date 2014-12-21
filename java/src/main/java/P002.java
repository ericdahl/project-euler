@SuppressWarnings("unused")
public class P002 implements Puzzle {
    @Override
    public String solve() {
        long sum = 2;
        long i = 1;
        long j = 2;
        long k = i + j;

        for (; k < 4000000; i = j, j = k, k = i + j) {
            if (k % 2 == 0) {
                sum += k;
            }
        }

        return "" + sum;
    }
}