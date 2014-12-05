-module(p048).

-export([start/0]).

f(N, SuffixLen) ->
  SSum = integer_to_list(lists:sum([ utils:pow(X, X) || X <- lists:seq(1, N) ])),
  element(1, string:to_integer(lists:sublist(SSum, length(SSum) - SuffixLen + 1, SuffixLen))).

start() ->
  io:format("~p ~n", [f(1000, 10)]).
