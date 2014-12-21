public class Runner {

    public static void main(String[] args) throws ClassNotFoundException, IllegalAccessException, InstantiationException {
        if (args.length < 1) {
            System.err.println("Usage: Runner problem-number");
            System.exit(1);
        }

        final String problem = args[0].toUpperCase();
        Class<?> clazz = Runner.class.getClassLoader().loadClass(problem);
        Puzzle p = (Puzzle) clazz.newInstance();

        final long start = System.currentTimeMillis();
        final String result = p.solve();
        final long stop = System.currentTimeMillis();

        System.out.println(String.format("%s (%d ms)", result, stop - start));
    }
}
