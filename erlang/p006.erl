-module(p006).

-export([start/0]).

f(N) ->
  L = lists:seq(1, N),
  SumSquares = lists:foldl(fun(X, Acc) -> Acc + X * X end, 0, L),
  SquareSum = lists:sum(L) * lists:sum(L),
  SquareSum - SumSquares.

start() ->
  io:format("~p ~n", [f(100)]).