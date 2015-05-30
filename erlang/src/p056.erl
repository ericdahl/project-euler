-module(p056).

-export([start/0]).

f() ->
  lists:max([sum(utils:pow(A, B)) || A <- lists:seq(90, 100), B <- lists:seq(90, 100)]).

sum(N) ->
  lists:sum([ I - $0 || I <- integer_to_list(N)]).

start() ->
  io:format("~p ~n", [f()]).

