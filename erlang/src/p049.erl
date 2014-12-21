-module(p049).

-export([start/0]).

f() ->
  Primes = lists:filter(fun(N) -> N >= 1000 end, utils:primes(10000)),
  SPrimes = sets:from_list(Primes),
  hd([ integer_to_list(N) ++ integer_to_list(N + Inc) ++ integer_to_list(N + 2 * Inc) ||
    N <- Primes,
    N /= 1487,
    Inc <- lists:seq(1, (9999 - N) div 2),
    N + 2 * Inc < 10000,
    sets:is_element(N + Inc, SPrimes),
    sets:is_element(N + 2 * Inc, SPrimes),
    same_digits(N, [N, N + Inc, N + 2 * Inc]) ]).

same_digits(N, Numbers) ->
  lists:all(fun(X) ->
    sets:from_list(integer_to_list(N)) == sets:from_list(integer_to_list(X))
  end, Numbers).

start() ->
  io:format("~p ~n", [f()]).