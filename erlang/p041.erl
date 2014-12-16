-module(p041).

-export([start/0]).

f() ->
  Primes = utils:primes(7654321),
  hd(lists:dropwhile(fun(N) -> not utils:pandigital(N) end, lists:reverse(Primes))).

start() ->
  io:format("~p ~n", [f()]).
