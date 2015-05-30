-module(p072).

-export([start/0]).

f() ->
  Primes = utils:primes(1000000),
  SPrimes = sets:from_list(Primes),
  lists:foldl(fun(I, Sum) -> Sum + phi(I, Primes, SPrimes) end, 0, lists:seq(2, 1000000)).

% Euler's Totient Function
phi(N, Primes, SPrimes) ->
  lists:foldl(fun(I, P) -> (P * (I - 1)) div I end, N, factors(N, Primes, SPrimes)).

factors(N, Primes, SPrimes) ->
  Prime = sets:is_element(N, SPrimes),
  if
    Prime -> [N];
    true -> factors(N, Primes)
  end.

factors(_N, []) -> [];
factors(N, [P|_Primes]) when P > N -> [];
factors(N, [P|Primes]) when N rem P == 0 -> [P|factors(N div P, Primes)];
factors(N, [_P|Primes]) -> factors(N, Primes).


start() ->
  io:format("~p ~n", [f()]).
