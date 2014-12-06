-module(p021).

-export([start/0]).

d(N) ->
  lists:sum(utils:divisors(N)).

f() ->
  lists:sum([ X || X <- lists:seq(1, 10000), X /= d(X), X == d(d(X))]).

start() ->
  io:format("~p ~n", [f()]).