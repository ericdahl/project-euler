-module(p005).

-export([run/0]).

f(Max) -> f(Max, Max).
f(N, Max) -> f(N, 2, Max).
f(N, I, Max) when I > Max -> N;
f(N, I, Max) when N rem I /= 0 -> f(N + Max, Max);
f(N, I, Max) -> f(N, I + 1, Max).


run() ->
  io:format("~p ~n", [f(20)]).