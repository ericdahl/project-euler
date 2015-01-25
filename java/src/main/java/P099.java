import java.io.IOException;
import java.math.BigInteger;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Comparator;
import java.util.List;
import java.util.stream.IntStream;

@SuppressWarnings("unused")
public class P099 implements Puzzle {

    @Override
    public String solve() {
        // Note: slow (~8 min)

        try {
            final List<String> lines = Files.readAllLines(Paths.get("resources/p099_base_exp.txt"));

            final int maxIndex = IntStream.range(0, lines.size())
                    .parallel()
                    .boxed()
                    .map(i -> {
                        String[] parts = lines.get(i).split(",");
                        BigInteger base = new BigInteger(parts[0]);
                        int exponent = Integer.valueOf(parts[1]);
                        return new IndexedValue(i, base.pow(exponent));
                    })
                    .max(Comparator.naturalOrder())
                    .orElseThrow(() -> new RuntimeException("nothing"))
                    .index;

            return "" + maxIndex + 1;
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private static class IndexedValue implements Comparable<IndexedValue> {
        int index;
        BigInteger value;

        public IndexedValue(int index, BigInteger value) {
            this.index = index;
            this.value = value;
        }

        @Override
        public int compareTo(IndexedValue o) {
            return value.compareTo(o.value);
        }
    }
}