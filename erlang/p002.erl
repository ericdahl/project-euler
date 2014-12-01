-module(p002).

-export([start/0]).


f(I, _, Acc, Max) when I >= Max -> Acc;
f(I, J, Acc, Max) when I rem 2 == 0 -> f(J, I + J, Acc + I, Max);
f(I, J, Acc, Max) -> f(J, I + J, Acc, Max).

start() ->
  io:format("~p ~n", [f(0, 1, 0, 4000000)]).