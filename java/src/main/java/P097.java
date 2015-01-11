import java.math.BigInteger;

@SuppressWarnings("unused")
public class P097 implements Puzzle {
    @Override
    public String solve() {
        String r = BigInteger.ONE.shiftLeft(7830457).multiply(BigInteger.valueOf(28433L)).add(BigInteger.ONE).toString();

        return r.substring(r.length() - 10);
    }
}