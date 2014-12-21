-module(p033).

-export([start/0]).

f() ->
  Fractions = [ {N, D} || N <- lists:seq(10, 99), D <- lists:seq(N, 99), N /= D, g(N, D) ],
  {N, D} = lists:foldl(fun({N, D}, {NAcc, DAcc}) -> {NAcc * N, DAcc * D} end, {1, 1}, Fractions),
  element(2, reduce(N, D)).

g(N, D) ->
  N1 = N div 10,
  N2 = N rem 10,
  D1 = D div 10,
  D2 = D rem 10,

  (N2 == D1 andalso D2 /= 0 andalso N1 / D2 == N / D) orelse
  (N1 == D2 andalso N2 / D1 == N / D).

reduce(N, D) ->
  CommonDivisors = sets:to_list(sets:intersection(sets:from_list(utils:divisors(N) ++ [N]), sets:from_list(utils:divisors(D)))),
  if
    CommonDivisors == [1] -> {N, D};
    true ->
      MaxCommon = lists:max(CommonDivisors),
      reduce(N div MaxCommon, D div MaxCommon)
  end.

start() ->
  io:format("~p ~n", [f()]).