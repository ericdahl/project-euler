-module(p025).

-export([start/0]).

f(Term, I, _, Max) when I > Max ->
  Term;
f(Term, I, J, Max) ->
  f(Term + 1, J, I + J, Max).

start() ->
  io:format("~p ~n", [f(1, 1, 1, utils:pow(10, 999))]).

