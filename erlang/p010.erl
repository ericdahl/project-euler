-module(p010).

-export([run/0]).

f() ->
  lists:sum(primes:primes(2000000)).

run() ->
  io:format("~p ~n", [f()]).