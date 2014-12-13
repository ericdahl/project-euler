-module(p043).

-export([start/0]).

f() ->
  lists:sum([element(1, string:to_integer(X)) || X <- utils:permutations("0123456789"), d2(X)]).

d2(N) ->
  Slots = [{2, 2}, {3, 3}, {4, 5}, {5, 7}, {6, 11}, {7, 13}, {8, 17}],
  lists:foldl(fun({I, D}, Res) -> Res andalso d(N, I, D) end, true, Slots).

d(N, I, Divisor) ->
  {V, _} = string:to_integer(lists:sublist(N, I, 3)),
  V rem Divisor == 0.

start() ->
  io:format("~p ~n", [f()]).
