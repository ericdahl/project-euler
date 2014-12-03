-module(utils).

-export([primes/1]).
-export([divisors/1]).
-export([pow/2]).

primes(N) ->
  L = lists:seq(2, N),
  primes(L, 2, math:sqrt(N)).

primes(L, I, Max) when I > Max ->
  L;

primes(L, I, Max) ->
  primes(lists:filter(fun(J) -> J =< I orelse J rem I /= 0 end, L), I + 1, Max).


divisors(N) ->
  [ A || A <- lists:seq(2, N div 2), N rem A == 0].

pow(Base, Exponent) when Base == 0, Exponent == 0 ->
  1;
pow(Base, Exponent) when Exponent == 1 ->
  Base;
pow(_, Exponent) when Exponent < 0 ->
  undefined;
pow(Base, Exponent) ->
  Base * pow(Base, Exponent -1).