-module(utils).

-export([primes/1]).
-export([divisors/1]).
-export([pow/2]).
-export([permutations/1]).
-export([factorial/1]).
-export([pandigital/1]).

primes(N) ->
  L = lists:seq(2, N),
  primes(L, 2, math:sqrt(N)).

primes(L, I, Max) when I > Max ->
  L;

primes(L, I, Max) ->
  primes(lists:filter(fun(J) -> J =< I orelse J rem I /= 0 end, L), I + 1, Max).


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

