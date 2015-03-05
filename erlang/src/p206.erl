-module(p206).

-export([start/0]).

f() ->
  Min = 1020304050607080900,
  Max = 1929394959697989990,
  g(trunc(math:sqrt(Min)), trunc(math:sqrt(Max))).

g(Curr, Max) ->
  R = Curr * Curr,
  Matches = matches(R, 9),
  if
    Matches -> Curr;
    true -> g(Curr + 10, Max)
  end.

matches(N, Digit) when Digit == 0 -> true;
matches(N, Digit) ->
  R = N div 100,
  R rem 10 == Digit andalso matches(R, Digit - 1).

start() ->
  io:format("~p ~n", [f()]).
