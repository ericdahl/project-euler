-module(p028).

-export([start/0]).

f(N) ->
  lists:foldl(fun(I, Sum) -> Sum + 4 * utils:pow(I, 2) - 6 * I + 6 end, 1, lists:seq(3, N, 2)).

start() ->
  io:format("~p ~n", [f(1001)]).


