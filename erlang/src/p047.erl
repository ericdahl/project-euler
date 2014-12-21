-module(p047).

-export([start/0]).

f() ->
  SPrimes = sets:from_list(utils:primes(1000)),
  g(1, 2, 3, 4, SPrimes).

g(A, B, C, D, SPrimes) ->
  NoMatch = lists:any(fun(X) -> h(X, SPrimes) /= 4 end, [A, B, C, D]),
  if
    NoMatch -> g(A + 1, B + 1, C + 1, D + 1, SPrimes);
    true -> A
  end.

h(N, SPrimes) ->
  Divisors = sets:from_list(utils:divisors(N)),
  PrimeDivisors = sets:to_list(sets:intersection(Divisors, SPrimes)),
  length(PrimeDivisors).

start() ->
  io:format("~p ~n", [f()]).
