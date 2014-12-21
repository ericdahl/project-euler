-module(p021).

-export([start/0, f/2]).

d(N) ->
  lists:sum(utils:divisors(N)).

f(I, J) ->
  lists:sum([ X || X <- lists:seq(I, J), X /= d(X), X == d(d(X))]).

launch(Processes) ->
  lists:sum([ rpc:yield(P) || P <- launch(1, 10000 div Processes, 10000) ]).

launch(I, _, Max) when I > Max ->
  [];

launch(I, Increment, Max) ->
  launch(I + Increment, Increment, Max) ++ [rpc:async_call(node(), ?MODULE, f, [I, I + Increment - 1])].

start() ->
  io:format("~p ~n", [launch(8 * erlang:system_info(logical_processors_available))]).