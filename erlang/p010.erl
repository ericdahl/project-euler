-module(p010).

-export([start/0]).

f() ->
  lists:sum(primes:primes(2000000)).

start() ->
  io:format("~p ~n", [f()]).