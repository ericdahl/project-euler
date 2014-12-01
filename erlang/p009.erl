-module(p009).

-export([start/0]).

f() ->
  {A, B} = hd([ {A, B} || A <- lists:seq(1, 1000), B <- lists:seq(1, A), A*A + B*B == (1000 - A - B) * (1000 - A - B) ]),
  C = 1000 - A - B,
  A * B * C.

start() ->
  io:format("~p ~n", [f()]).