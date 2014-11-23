-module(p001).

-export([run/0]).

val(N) when N rem 3 == 0 -> N;
val(N) when N rem 5 == 0 -> N;
val(_) -> 0.

run() ->
  Result = lists:foldl(fun(X, Sum) -> val(X) + Sum end, 0, lists:seq(1, 999)),
  io:format("~p ~n", [Result]).




