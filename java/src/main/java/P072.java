import java.util.BitSet;
import java.util.stream.LongStream;

@SuppressWarnings("unused")
public class P072 implements Puzzle {

    @Override
    public String solve() {
        final BitSet primesBits = Util.primesBits(1_000_000);
        return "" + LongStream.range(2, 1_000_001)
                .parallel()
                .map(i -> phi((int) i, primesBits))
                .sum();
    }

    // Euler's Totient Function
    long phi(long n, BitSet primeBits) {
        return Util.uniqueFactors((int) n, primeBits).reduce(n, (product, i) -> product * (i - 1) / i);
    }
}