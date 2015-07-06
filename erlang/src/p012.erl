-module(p012).

-export([start/0]).
-export([divisors/1]).

f() -> f(1).

f(N) ->
  T = triangle(N),
  D = divisors(T),
  if
    D > 500 -> T;
    true -> f(N + 1)
  end.

triangle(N) -> N * (N + 1) div 2.

divisors(N) -> divisors(N, 1).

divisors(N, I) when I * I > N -> 0;
divisors(N, I) when N rem I == 0 -> 2 + divisors(N, I + 1);
divisors(N, I) -> divisors(N, I + 1).


start() ->
  io:format("~p ~n", [f()]).
