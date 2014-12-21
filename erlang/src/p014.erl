-module(p014).

-export([start/0]).

f() ->
    element(2, lists:max([ {g(X), X} || X <- lists:seq(1, 1000000) ])).

g(N) when N == 1 ->
    1;

g(N) when N rem 2 == 0 ->
    1 + g(N div 2);

g(N) ->
    1 + g(3 * N + 1).

start() ->
  io:format("~p ~n", [f()]).

