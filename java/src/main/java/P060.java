import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@SuppressWarnings("unused")
public class P060 implements Puzzle {


    @Override
    public String solve() {

        final Set<Integer> sprimes = Util.primes(100000000);
        final List<Integer> primes = sprimes.stream()
                .parallel()
                .filter(i -> i < 10000)
                .sorted()
                .collect(Collectors.toList());

        final Map<Integer, Set<Integer>> map = primes.stream()
                .collect(Collectors.toMap(Function.identity(), p -> new HashSet<>()));

        for (int iIndex = 1; iIndex < primes.size(); ++iIndex) {
            final int i = primes.get(iIndex);
            final String iString = String.valueOf(i);

            for (int j : primes.subList(iIndex + 1, primes.size())) {
                final String jString = String.valueOf(j);
                if (sprimes.contains(Integer.valueOf(iString + jString)) &&
                        sprimes.contains(Integer.valueOf(jString + iString))) {
                    map.get(i).add(j);
                    map.get(j).add(i);
                }
            }
        }


        for (int aIndex = 0; aIndex < primes.size(); ++aIndex) {
            final Integer a = primes.get(aIndex);
            final Set<Integer> set = map.get(a);

            for (int bIndex = aIndex + 1; bIndex < primes.size(); ++bIndex) {
                final Integer b = primes.get(bIndex);
                final Set<Integer> bSet = map.get(b);

                if (bSet.contains(a)) {
                    for (int cIndex = bIndex + 1; cIndex < primes.size(); ++cIndex) {
                        final Integer c = primes.get(cIndex);
                        final Set<Integer> cSet = map.get(c);

                        if (cSet.contains(a) && cSet.contains(b)) {
                            for (int dIndex = cIndex + 1; dIndex < primes.size(); ++dIndex) {
                                final Integer d = primes.get(dIndex);
                                final Set<Integer> dSet = map.get(d);

                                if (dSet.contains(a) && dSet.contains(b) && dSet.contains(c)) {
                                    for (int eIndex = dIndex + 1; eIndex < primes.size(); ++eIndex) {
                                        final Integer e = primes.get(eIndex);
                                        final Set<Integer> eSet = map.get(e);

                                        if (eSet.contains(a) && eSet.contains(b) && eSet.contains(c) && eSet.contains(d)) {
                                            return "" + (a + b + c + d + e);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        throw new RuntimeException("no solution found");
    }

}