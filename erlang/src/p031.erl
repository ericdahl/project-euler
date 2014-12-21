-module(p031).

-export([start/0]).

% FIXME: inefficient (~25 min)
f() ->
  length([ {P1, P2, P5, P10, P20, P50, P100, P200} ||
    P1 <- lists:seq(0, 200),
    P2 <- lists:seq(0, 200, 2),
    P5 <- lists:seq(0, 200, 5),
    P10 <- lists:seq(0, 200, 10),
    P20 <- lists:seq(0, 200, 20),
    P50 <- lists:seq(0, 200, 50),
    P100<- lists:seq(0, 200, 100),
    P200 <- lists:seq(0, 200, 200),
    200 == P1 + P2 + P5 + P10 + P20 + P50 + P100 + P200 ]).

start() ->
  io:format("~p ~n", [f()]).

