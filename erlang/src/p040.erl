-module(p040).

-export([start/0]).

f() ->
  A = g(1, 1000000),
  L = [utils:pow(10, Exp) || Exp <- lists:seq(0, 6)],
  lists:foldl(fun(N, P) -> P * (lists:nth(N, A) - $0) end, 1, L).

g(N, Limit) when N > Limit ->
  "";

g(N, Limit) ->
  integer_to_list(N) ++ g(N + 1, Limit).

start() ->
  io:format("~p ~n", [f()]).
