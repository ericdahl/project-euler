var _ = require('lodash');

exports.solve = function() {

    var max = 12000,
        primes = genPrimes(max + 1),
        factors = genFactors(max + 1, primes),
        count = 0;


    for (var d = 2; d <= max; ++d) {
        for (var n = Math.floor(d / 3) + 1; n < Math.floor((d - 1) / 2) + 1; ++n) {
            if (n / d > 1 / 3 && n / d < 1 / 2 && isRelativePrime(n, d, factors)) {
                ++count;
            }
        }
    }
    return count;





    function genPrimes(number) {
        var primes = _.fill(new Array(number), true);
        primes[0] = false;
        primes[1] = false;

        for (var curr = 2; curr < number; ) {
            for (var j = curr * 2; j < number; j += curr) {
                primes[j] = false;
            }

            for (curr += 1; curr < number && !primes[curr]; curr++) {
                // nothing
            }
        }

        return primes.map(function(prime, index) {
            return prime ? index : undefined;
        }).filter(function(prime) {
            return prime !== undefined;
        });
    }

    function genFactors(max, primes) {
        return _.range(max).map(function(i) {
            if (i < 2) {
                return [];
            }
            return factorize(i, primes);
        });
    }

    function factorize(n, primes) {
        var factors = [],
            value = n;

        for (var i = 0; i < primes.length; ++i) {
            if (primes[i] > value) {
                break;
            }

            var r = value / primes[i];
            if (r == Math.floor(r)) {
                value /= primes[i];
                factors.push(primes[i]);
            }
        }
        return factors;
    }

    function isRelativePrime(a, b, factors) {
        for (var i = 0; i < factors[a].length; ++i) {
            for (var j = 0; j < factors[b].length; ++j) {
                if (factors[a][i] === factors[b][j]) {
                    return false;
                }
                if (factors[b][j] > factors[a][i]) {
                    break;
                }
            }
        }
        return true;
    }
};