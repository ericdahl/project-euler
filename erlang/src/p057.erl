-module(p057).

-export([start/0]).

f() -> g(0).

g(I) when I == 0 -> g(1, 1, 2).

g(I, _N, _D) when I > 1000 -> 0;
g(I, N, D) ->
  NextN = D,
  NextD = D * 2 + N,
  greater(NextN + NextD, NextD) + g(I + 1, NextN, NextD).

greater(N, D) ->
  LenN = length(integer_to_list(N)),
  LenD = length(integer_to_list(D)),
  if
    LenN > LenD -> 1;
    true -> 0
  end.


start() ->
  io:format("~p ~n", [f()]).