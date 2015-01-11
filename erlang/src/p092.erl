-module(p092).

-export([start/0]).

f() ->
  count(10000000).

count(N) when N == 0 -> 0;
count(N) -> g(N) + count(N - 1).

g(N) when N == 1 -> 0;
g(N) when N == 89 -> 1;
g(N) -> g(next(N)).


next(N) ->
  lists:sum([ utils:pow(I - $0, 2) || I <- integer_to_list(N) ]).


start() ->
  io:format("~p ~n", [f()]).
