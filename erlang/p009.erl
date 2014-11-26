-module(p009).

-export([run/0]).

f() ->
  f(1, 1).

f(A, B) when A > 998 ->
  f(1, B + 1);

f(A, B) ->
  C = 1000 - (A + B),
  if
    A*A + B*B == C*C -> A * B * C;
    true -> f(A + 1, B)
  end.


run() ->
  io:format("~p ~n", [f()]).