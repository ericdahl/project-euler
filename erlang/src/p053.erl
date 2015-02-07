-module(p053).

-export([start/0]).

c(_N, R) when R == 0 -> 1;
c(N, R) when R == 1 -> N;
c(N, R) -> utils:factorial(N) div (utils:factorial(R) * utils:factorial(N - R)).


f() -> g(1).

g(N) when N > 100 -> 0;
g(N) -> g(N, 1).

g(N, R) when R == N -> g(N + 1);
g(N, R) ->
  Res = c(N, R),
  if
    Res > 1000000 -> 1 + g(N, R + 1);
    true -> g(N, R + 1)
  end.

start() ->
  io:format("~p ~n", [f()]).