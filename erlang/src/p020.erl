-module(p020).

-export([start/0]).

f(N) ->
  lists:foldl(fun(X, Sum) -> Sum + X - $0 end, 0, integer_to_list(fact(N))).

fact(N) ->
  lists:foldl(fun(X, Product) -> Product * X end, 1, lists:seq(1, N)).

start() ->
  io:format("~p ~n", [f(100)]).

