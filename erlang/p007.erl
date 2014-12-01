-module(p007).

-export([start/0]).

f() ->
  lists:nth(10001, primes:primes(1000000)).

start() ->
  io:format("~p ~n", [f()]).