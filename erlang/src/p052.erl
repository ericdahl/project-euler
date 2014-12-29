-module(p052).

-export([start/0]).

f() ->
  g(1).

g(N) ->
  R = same(N, N * 2) andalso same(N * 3, N * 4) andalso same(N * 5, N * 6) andalso same(N, N * 6),
  if
    R -> N;
    true -> g(N + 1)
  end.

same(A, B) ->
  lists:sort(integer_to_list(A)) == lists:sort(integer_to_list(B)).

start() ->
  io:format("~p ~n", [f()]).