-module(p034).

-export([start/0]).

fact(N) when N =< 1 ->
  1;
fact(N) ->
  N * fact(N - 1).

g(N) ->
  N == lists:sum([ fact(X - $0) || X <- integer_to_list(N) ]).

f(Max) ->
  lists:sum([ X || X <- lists:seq(10, Max), g(X) ]).

start() ->
  io:format("~p ~n", [f(200000)]).

