-module(p061).

-export([start/0]).

f() ->
  Tris = [ [N] || N <- triangular(1000), N > 1000, N < 10000 ],
  Squares = [ [N] || N <- square(1000), N > 1000, N < 10000 ],
  Pents = [ [N] || N <- pentagonal(1000), N > 1000, N < 10000 ],
  Hexes = [ [N] || N <- hexagonal(1000), N > 1000, N < 10000 ],
  Hepts = [ [N] || N <- heptagonal(1000), N > 1000, N < 10000 ],
  Octs = [ [N] || N <- octagonal(1000), N > 1000, N < 10000 ],

  MatchingOrders = lists:filter(fun(P) -> length(looping_paths(P)) > 0 end, utils:permutations([Octs, Hepts, Hexes, Pents, Squares, Tris])),
  lists:sum(hd(looping_paths(hd(MatchingOrders)))).

looping_paths(L) -> lists:filter(fun(Chain) -> last(lists:last(Chain)) == first(hd(Chain)) end, paths(L)).

common(ListA, ListB) -> [ A ++ B || A <- ListA, B <- ListB, last(lists:last(A)) == first(hd(B)) ].

paths([H]) -> H;
paths([H|T]) -> common(H, paths(T)).

last(N) -> N rem 100.
first(N) ->  N div 100.

triangular(N) -> [ I * (I + 1) div 2 || I <- lists:seq(1, N) ].
square(N) -> [ I * I || I <- lists:seq(1, N) ].
pentagonal(N) -> [ I * (3 * I  - 1) div 2 || I <- lists:seq(1, N) ].
hexagonal(N) -> [ I * (2 * I  - 1) || I <- lists:seq(1, N) ].
heptagonal(N) -> [ I * (5 * I  - 3) div 2 || I <- lists:seq(1, N) ].
octagonal(N) -> [ I * (3 * I  - 2) || I <- lists:seq(1, N) ].

start() ->
  io:format("~p ~n", [f()]).

