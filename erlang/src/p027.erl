-module(p027).

-export([start/0]).


g(N, A, B, SPrimes) ->
  Match = sets:is_element(N * N + A * N + B, SPrimes),
  if
    Match -> 1 + g(N + 1, A, B, SPrimes);
    true -> 0
  end.

f() ->
  Primes = utils:primes(5000),
  SPrimes = sets:from_list(Primes),
  {_, A, B} = lists:max([ {g(0, A, B, SPrimes), A, B} || A <- lists:seq(-999, 999), B <- Primes, abs(B) < 1000 ]),
  A * B.


start() ->
  io:format("~p ~n", [f()]).

