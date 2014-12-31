-module(p087).

-export([start/0]).

f() ->
  Limit = 50000000,
  Squares = lists:filter(fun(N) -> N < Limit end, lists:map(fun(N) -> utils:pow(N, 2) end, utils:primes(round(math:pow(Limit, 1/2)) + 1))),
  Cubes = lists:filter(fun(N) -> N < Limit end, lists:map(fun(N) -> utils:pow(N, 3) end, utils:primes(round(math:pow(Limit, 1/3)) + 1))),
  Forths = lists:filter(fun(N) -> N < Limit end, lists:map(fun(N) -> utils:pow(N, 4) end, utils:primes(round(math:pow(Limit, 1/4)) + 1))),
  sets:size(sets:from_list([ A1 + B1 + C1 || A1 <- Squares, B1 <- Cubes, C1 <- Forths, A1 + B1 + C1 < Limit ])).

start() ->
  io:format("~p ~n", [f()]).

