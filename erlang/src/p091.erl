-module(p091).

-export([start/0]).

f() ->
  R = lists:seq(0, 50),
  length([ {X1, Y1, X2, Y2} || X1 <- R,
                               X2 <- R,
                               Y1 <- R,
                               Y2 <- R,
                               is_right(X1, Y1, X2, Y2)]) div 2.

is_right(X1, Y1, X2, Y2) ->
  A = d_squared(0, 0, X1, Y1),
  B = d_squared(X1, Y1, X2, Y2),
  C = d_squared(X2, Y2, 0, 0),

  A > 0 andalso
    B > 0 andalso
    C > 0 andalso
    (A == B + C orelse B == A + C orelse C == A + B).

d_squared(X1, Y1, X2, Y2) ->
  (X2 - X1) * (X2 - X1) + (Y2 - Y1) * (Y2 - Y1).

start() ->
  io:format("~p ~n", [f()]).

