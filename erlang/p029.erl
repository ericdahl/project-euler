-module(p029).

-export([start/0]).

f() ->
  R = lists:seq(2, 100),
  sets:size(sets:from_list([ utils:pow(A, B) || A <- R, B <- R ])).

start() ->
  io:format("~p ~n", [f()]).

