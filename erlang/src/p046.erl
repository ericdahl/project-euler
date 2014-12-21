-module(p046).

-export([start/0]).

f() ->
  Primes = utils:primes(10000),
  SPrimes = sets:from_list(Primes),
  Squares = sets:from_list([ 2 * X * X || X <- lists:seq(1, 100) ]),
  hd([ X || X <- lists:seq(3, 10000, 2), not sets:is_element(X, SPrimes), g(X, Primes, Squares) ]).

g(N, [P|Primes], Squares) ->
  Member = sets:is_element(N - P, Squares),
  if
    Member -> false;
    true -> g(N, Primes, Squares)
  end;

g(_, _, _) ->
  true.

start() ->
  io:format("~p ~n", [f()]).

