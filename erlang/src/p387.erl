-module(p387).

-export([start/0]).

-define(LIMIT, 100000000000000).

f() ->
  lists:sum([g(D, D) || D <- lists:seq(1, 9)]).

g(N, _DigitSum) when N > ?LIMIT -> 0;
g(N, DigitSum) -> g(N, 0, DigitSum).

g(_N, 10, _DigitSum) -> 0;
g(N, I, DigitSum) ->
  Next = N * 10 + I,
  NextDigitSum = DigitSum + I,
  case right(Next, NextDigitSum) of
    true -> strong_sum(Next, NextDigitSum) + g(Next, NextDigitSum);
    false -> 0
  end + g(N, I + 1, DigitSum).

strong_sum(N, DigitSum) ->
  case utils:is_prime(N div DigitSum) of
    true ->
      lists:sum([N * 10 + D || D <- lists:seq(1, 9, 2), N * 10 + D < ?LIMIT, utils:is_prime(N * 10 + D)]);
    false -> 0
  end.

right(N, DigitSum) ->
  N rem DigitSum == 0.

start() ->
  io:format("~p ~n", [f()]).
