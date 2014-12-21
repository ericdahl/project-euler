-module(p035).

-export([start/0]).


f() ->
  Primes = sets:from_list(utils:primes(1000000)),
  length([ X || X <- lists:seq(2, 1000000), g(X, Primes) ]).

g(N, Primes) ->
  R = rotate(N),
  length(R) == length([ X || X <- R, sets:is_element(X, Primes) ]).

rotate(N) ->
  LN = integer_to_list(N),
  rotate(LN, length(LN)).

rotate(_, I) when I == 0 ->
  [];

rotate([H|T], I) ->
  N = T ++ [H],
  [element(1, string:to_integer(N)) | rotate(N, I - 1)].

start() ->
  io:format("~p ~n", [f()]).

