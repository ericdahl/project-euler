-module(p023).

-export([start/0]).

f() ->
  A = [ N || N <- lists:seq(2, 29000), lists:sum(utils:divisors(N)) > N ],
  lists:sum(g(sets:from_list(lists:seq(1, 29000)), A)).

g(R, []) -> sets:to_list(R);
g(R, [H|T]) -> g(sets:subtract(R, sets:from_list([ H + X || X <- [H|T] ])), T).

start() ->
  io:format("~p ~n", [f()]).

