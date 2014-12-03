-module(p045).

-export([start/0]).

tri(N, Max) when N == Max ->
  [];
tri(N, Max) ->
  [ N * (N + 1) div 2 | tri(N + 1, Max) ].


pent(N, Max) when N == Max ->
  [];
pent(N, Max) ->
  [  N * (3 * N - 1) div 2 | pent(N + 1, Max) ].


hex(N, Max) when N == Max ->
  [];
hex(N, Max) ->
  [ N * (2 * N - 1) | hex(N + 1, Max) ].


f(N, Max) ->
  STri = sets:from_list(tri(N, Max)),
  SPent = sets:from_list(pent(N, Max)),
  SHex = sets:from_list(hex(N, Max)),
  hd(sets:to_list(sets:intersection([STri, SPent, SHex]))).

start() ->
  io:format("~p ~n", [f(286, 100000)]).

