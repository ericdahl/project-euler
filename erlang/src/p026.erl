-module(p026).

-export([start/0]).

f() ->
  element(2, lists:max([ {repeats(I, [], 1), I} || I <- lists:seq(2, 999) ])).

repeats(_N, _L, R) when R == 0 -> 0;

repeats(N, L, R) ->
  Rem = R rem N,
  Loop = lists:member(Rem, L),
  if
    Loop -> length(L) - index(L, Rem) + 1;
    true -> repeats(N, L ++ [Rem], Rem * 10)
  end.

index(L, N) -> index(L, N, 1).
index([], _N, _Index) -> undefined;
index([H|_T], N, Index) when H == N -> Index;
index([_H|T], N, Index) -> index(T, N, Index + 1).


start() ->
  io:format("~p ~n", [f()]).




