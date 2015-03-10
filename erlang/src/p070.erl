-module(p070).

-export([start/0]).

f() ->
  Max = utils:pow(10, 7),
  Primes = [ P || P <- utils:primes(4000), P > 2000 ],
  element(2, lists:min([ {(A * B) / phi(A, B), A * B} || A <- Primes,
                                                         B <- Primes,
                                                         is_perm(A * B, phi(A, B)),
                                                         A * B < Max ])).
is_perm(A, B) ->
  lists:sort(integer_to_list(A)) == lists:sort(integer_to_list(B)).

phi(A, B) ->
  (A - 1) * (B - 1).

start() ->
  io:format("~p ~n", [f()]).
