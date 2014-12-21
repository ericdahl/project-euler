-module(p016).

-export([start/0]).

f() ->
  N = integer_to_list(1 bsl 1000),
  lists:foldl(fun(X, Sum) -> Sum + X - $0 end, 0, N).

start() ->
  io:format("~p ~n", [f()]).

