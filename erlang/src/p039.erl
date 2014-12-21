-module(p039).

-export([start/0]).

f() ->
  element(2, lists:max([ {f(X), X} || X <- lists:seq(1, 1000) ])).

f(P) ->
  length([ {A, B} || A <- lists:seq(1, P),
                     B <- lists:seq(1, A),
                     (P - A - B) * (P - A - B) == A * A + B * B ]).

start() ->
  io:format("~p ~n", [f()]).

