-module(p024).

-export([start/0]).

f() ->
  element(1, string:to_integer(lists:nth(1000000, utils:permutations("0123456789")))).

start() ->
  io:format("~p ~n", [f()]).

