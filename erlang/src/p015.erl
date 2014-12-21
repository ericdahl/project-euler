-module(p015).

-export([start/0]).

f(N) ->
  utils:factorial(2 * N) div utils:pow(utils:factorial(N), 2).

start() ->
  io:format("~p ~n", [f(20)]).

