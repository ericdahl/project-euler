-module(p063).

-export([start/0]).

f() ->
  lists:sum([ count(Base) || Base <- lists:seq(1, 50) ]).

count(Exponent) ->
  Min = utils:pow(10, Exponent - 1),
  Max = utils:pow(10, Exponent),
  count(1, Exponent, Min, Max).

count(Base, Exponent, Min, Max) ->
  Res = utils:pow(Base, Exponent),
  if
    Res >= Max -> 0;
    Res >= Min -> 1 + count(Base + 1, Exponent, Min, Max);
    true -> count(Base + 1, Exponent, Min, Max)
  end.

start() ->
  io:format("~p ~n", [f()]).