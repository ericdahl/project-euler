-module(p071).

-export([start/0]).

f() ->
  Target = 3 / 7,
  Min = Target * 0.999,
  Limit = 1000000,
  element(2, lists:max([ {N / D, N} || D <- lists:seq(Limit - 10, Limit),
                     N <- lists:seq(trunc(D * Target), D),
                     N / D < Target,
                     N / D > Min,
                     utils:is_relative_prime(N, D) ])).

start() ->
  io:format("~p ~n", [f()]).
