#include <iostream>

#include <set>
#include <map>

std::set<int> gen_primes(const int max);
std::map<int, std::set<int> > gen_factors(const int max, const std::set<int>& primes);
bool is_relative_prime(const int a, const int b, const std::map<int, std::set<int> >& factors);

// c++ -Wall -O2 -std=c++11 p073.cpp
int main(int argc, char** argv) {

    const int max = 12000;
    const std::set<int> primes = gen_primes(max + 1);
    const std::map<int, std::set<int> > factors = gen_factors(max + 1, primes);

    int count = 0;
    for (int d = 2; d <= max; ++d) {
        for (int n = d / 3 + 1; n < (d - 1) / 2 + 1; ++n) {
            const double result = 1.0 * n / d;
            if (result > 1.0 / 3.0 && result < 1.0 / 2.0 && is_relative_prime(n, d, factors)) {
                count++;
            }
        }
    }
    std::cout << count << std::endl;

    return EXIT_SUCCESS;
}

std::set<int> gen_primes(const int max) {
    std::set<int> primes;
    for (int i = 2; i < max; ++i) {
        primes.insert(primes.cend(), i);
    }

    for (auto it = primes.cbegin(); *it < max / 2 && it != primes.cend(); ++it) {
        for (int pi = *it * 2; pi < max; pi += *it) {
            primes.erase(pi);
        }
    }
    return primes;
}

std::map<int, std::set<int> > gen_factors(const int max, const std::set<int>& primes) {
    std::map<int, std::set<int> > factors;
    factors[1] = std::set<int>();

    for (int i = 2; i < max; ++i) {
        std::set<int> n_factors;

        int n = i;
        for (auto p_it = primes.cbegin(); n > 1 && p_it != primes.cend(); ++p_it) {
            if (n % *p_it == 0) {
                n /= *p_it;
                n_factors.insert(*p_it);
            }
        }
        factors[i] = n_factors;
    }

    return factors;
}

bool is_relative_prime(const int a, const int b, const std::map<int, std::set<int> >& factors) {
    for (auto a_it = factors.at(a).cbegin(); a_it != factors.at(a).cend(); ++a_it) {
        for (auto b_it = factors.at(b).cbegin(); b_it != factors.at(b).cend(); ++b_it) {
            if (*a_it == *b_it) {
                return false;
            }
            if (*b_it > *a_it) {
                // sets are ordered
                break;
            }
        }
    }
    return true;
}