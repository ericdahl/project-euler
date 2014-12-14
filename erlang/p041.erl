-module(p041).

-export([start/0]).

f() ->
  Primes = utils:primes(7654321),
  hd(lists:dropwhile(fun(N) -> not pan(N) end, lists:reverse(Primes))).

pan(N) ->
  S = integer_to_list(N),
  sets:from_list(S) == sets:from_list(lists:seq($1, $0 + length(S))).

start() ->
  io:format("~p ~n", [f()]).
