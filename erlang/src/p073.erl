-module(p073).

-export([start/0]).

f() ->
  Dict = factor_dict(12000, utils:primes(12000)),
  length([ {N, D} || D <- lists:seq(2, 12000), 
                     N <- lists:seq(D div 3 + 1, (D - 1) div 2 + 1), 
                     N / D > 1 / 3, 
                     N / D < 1 / 2, 
                     sets:is_disjoint(dict:fetch(N, Dict), dict:fetch(D, Dict)) ]).

factor_dict(N, Primes) when N == 1 -> dict:new();
factor_dict(N, Primes) -> dict:store(N, sets:from_list(utils:factors(N, Primes)), factor_dict(N - 1, Primes)).


start() ->
  io:format("~p ~n", [f()]).
