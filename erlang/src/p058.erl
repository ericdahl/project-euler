-module(p058).

-export([start/0]).


f() ->
  f(1, 0, 0).

f(N, I, PrimeCount)  ->
  Inc = ((I div 4) + 1) * 2,
  PrimeRatio = PrimeCount / (I + 1),
  IsPrime = utils:is_prime(N),

  if
    Inc > 3 andalso I rem 4 == 0 andalso PrimeRatio < 0.1 -> Inc - 1;
    IsPrime -> f(N + Inc, I + 1, PrimeCount + 1);
    true    -> f(N + Inc, I + 1, PrimeCount)
  end.

start() ->
  io:format("~p ~n", [f()]).

