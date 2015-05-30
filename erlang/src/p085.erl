-module(p085).

-export([start/0]).

f() ->
  {_, W, H} = lists:min([ {abs(2000000 - count(W, H)), W, H} || W <- lists:seq(1, 100), H <- lists:seq(W, 100) ]),
  W * H.


count(W, H) -> count(W, H, 0, 0).
count(W, _H, X, _Y) when X == W -> 0;
count(W, H, X, Y) when Y == H -> count(W, H, X + 1, 0);
count(W, H, X, Y) -> (W - X) * (H - Y) + count(W, H, X, Y + 1).

start() ->
  io:format("~p ~n", [f()]).
