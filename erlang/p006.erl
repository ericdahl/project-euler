-module(p006).

-export([run/0]).

f(N) ->
  L = lists:seq(1, N),
  SumSquares = lists:foldl(fun(X, Acc) -> Acc + X * X end, 0, L),
  SquareSum = lists:sum(L) * lists:sum(L),
  SquareSum - SumSquares.

run() ->
  io:format("~p ~n", [f(100)]).