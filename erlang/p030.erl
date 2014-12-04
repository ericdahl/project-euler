-module(p030).

-export([start/0]).

f() ->
  D = d(9),
  lists:sum([ N || N <- lists:seq(2, 770000), g(N, D) ]).

g(N, D) ->
  N == lists:sum([ dict:fetch(X - $0, D) || X <- integer_to_list(N) ]).

d(N) when N < 0 ->
  dict:new();
d(N) ->
  dict:store(N, utils:pow(N, 5), d(N - 1)).

start() ->
  io:format("~p ~n", [f()]).

