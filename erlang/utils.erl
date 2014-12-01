-module(utils).

-export([primes/1]).
-export([divisors/1]).

primes(N) ->
  L = lists:seq(2, N),
  primes(L, 2, math:sqrt(N)).

primes(L, I, Max) when I > Max ->
  L;

primes(L, I, Max) ->
  primes(lists:filter(fun(J) -> J =< I orelse J rem I /= 0 end, L), I + 1, Max).


divisors(N) ->
  [ A || A <- lists:seq(2, N div 2), N rem A == 0].
