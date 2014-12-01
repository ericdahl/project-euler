-module(p007).

-export([run/0]).

f() ->
  lists:nth(10001, primes:primes(1000000)).

run() ->
  io:format("~p ~n", [f()]).