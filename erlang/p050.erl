-module(p050).

-export([start/0]).

f(Limit) ->
  Primes = utils:primes(Limit),
  SPrimes = sets:from_list(Primes),
  find(lists:seq(1000, 1, -1), Primes, SPrimes, Limit).

find([N|T], Primes, SPrimes, Limit) ->
  R = longest_sum(1, N, Primes, SPrimes, Limit),
  if
    R == 0 -> find(T, Primes, SPrimes, Limit);
    true -> R
  end.

longest_sum(I, _, _, _, Limit) when I > Limit ->
  0;

longest_sum(I, N, Primes, SPrimes, Limit) ->
  Sum = lists:sum(lists:sublist(Primes, I, N)),
  Match = sets:is_element(Sum, SPrimes),
  if
    Sum > Limit -> 0;
    Match -> Sum;
    true -> longest_sum(I + 1, N, Primes, SPrimes, Limit)
  end.


start() ->
  io:format("~p ~n", [f(1000000)]).
