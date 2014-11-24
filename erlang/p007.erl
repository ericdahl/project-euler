-module(p007).

-export([run/0]).

p(N) ->
  L = lists:seq(2, N),
  p(L, 2, math:sqrt(N)).

p(L, I, Max) when I > Max ->
  L;

p(L, I, Max) ->
  p(lists:filter(fun(J) -> J =< I orelse J rem I /= 0 end, L), I + 1, Max).

run() ->
  io:format("~p ~n", [lists:nth(10001, p(1000000))]).