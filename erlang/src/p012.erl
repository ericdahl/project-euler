-module(p012).

-export([start/0]).
-export([divisors/1]).

%% FIXME: slow (25 minutes)

f() ->
  y(1, 80).

y(I, Threads) ->
  Results = rpc:parallel_eval(lists:map(fun(I) -> {p012, z, [triangle(I)]} end, lists:seq(I, I + Threads))),
  Matches = lists:filter(fun({Divisors, _N}) -> Divisors > 500 end, Results),
  if
    length(Matches) > 0 -> element(2, hd(lists:sort(Matches)));
    true -> y(I + Threads, Threads)
  end.

triangle(N) -> N * (N + 1) div 2.

divisors(N) -> {divisors(N, N div 2), N}.

divisors(_N, I) when I =< 1 -> 1;
divisors(N, I) when N rem I == 0 -> 1 + divisors(N, I - 1);
divisors(N, I) -> divisors(N, I - 1).


start() ->
  io:format("~p ~n", [f()]).
