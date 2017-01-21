-module(utils).

-export([primes/1]).
-export([is_prime/1]).
-export([divisors/1]).
-export([pow/2]).
-export([permutations/1]).
-export([factorial/1]).
-export([pandigital/1]).
-export([palindrome/1]).
-export([factors/1]).
-export([factors/2]).
-export([is_relative_prime/2]).
-export([binary_to_integer/1]).

primes(N) ->
  L = lists:seq(2, N),
  primes(L, 2, math:sqrt(N)).

primes(L, I, Max) when I > Max ->
  L;

primes(L, I, Max) ->
  primes(lists:filter(fun(J) -> J =< I orelse J rem I /= 0 end, L), I + 1, Max).

is_prime(2) -> true;
is_prime(N) when N == 1 orelse N rem 2 == 0 -> false;
is_prime(N) -> is_prime(N, 3).
is_prime(N, I) when I * I > N -> true;
is_prime(N, I) when N rem I == 0 -> false;
is_prime(N, I) -> is_prime(N, I + 2).

factors(N) -> factorize(N, 2).
factorize(N, _I) when N =< 1 -> [];
factorize(N, I) when N rem I == 0 -> [ I | factorize(N div I, I) ];
factorize(N, I) -> factorize(N, I + 1).

factors(_N, []) -> [];
factors(N, [P|_Primes]) when P > N -> [];
factors(N, [P|Primes]) when N rem P == 0 -> [P|factors(N div P, Primes)];
factors(N, [_P|Primes]) -> factors(N, Primes).


is_relative_prime(A, B) ->
  FactorsA = factors(A),
  is_relative_prime_factors(B, FactorsA).

is_relative_prime_factors(_B, []) -> true;
is_relative_prime_factors(B, [F|_FactorsA]) when B rem F == 0 -> false;
is_relative_prime_factors(B, [_F|FactorsA]) -> is_relative_prime_factors(B, FactorsA).


divisors(N) ->
  [ A || A <- lists:seq(1, N div 2), N rem A == 0].

pow(_, Exponent) when Exponent == 0 ->
  1;
pow(_, Exponent) when Exponent < 0 ->
  undefined;
pow(Base, Exponent) ->
  Base * pow(Base, Exponent -1).

permutations([]) ->
  [[]];
permutations(L) ->
  [[H|T] || H <- L, T <- permutations(L--[H])].

factorial(N) when N == 1 ->
  1;
factorial(N) ->
  N * factorial(N - 1).

pandigital(N) when is_integer(N) ->
  pandigital(integer_to_list(N));

pandigital(S) ->
  sets:from_list(S) == sets:from_list(lists:seq($1, $0 + length(S))).

palindrome(N) ->
  lists:reverse(integer_to_list(N)) == integer_to_list(N).

binary_to_integer(B) ->
  list_to_integer(binary_to_list(B)).
