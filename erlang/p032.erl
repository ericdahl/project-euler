-module(p032).

-export([start/0]).


f() ->
  PossibleEquations = lists:concat([ g(X) || X <- utils:permutations("123456789") ]),
  Products = [ P || {A, B, P} <- PossibleEquations , A * B == P ],
  lists:sum(sets:to_list(sets:from_list(Products))).

g(N) ->
  [ {element(1, string:to_integer(lists:sublist(N, A))),
     element(1, string:to_integer(lists:sublist(N, A + 1, B - A))),
     element(1, string:to_integer(lists:sublist(N, B + 1, length(N))))} || A <- lists:seq(2, 4), B <- lists:seq(5, 5) ].

start() ->
  io:format("~p ~n", [f()]).

