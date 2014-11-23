-module(p003).

-export([run/0]).

f(N) -> f(N, 2).
f(1, I) -> I;
f(N, I) when N rem I == 0 -> f(N div I, I);
f(N, I) -> f(N, I + 1).

run() ->
  io:format("~p ~n", [f(600851475143)]).