-module(p038).

-export([start/0]).

f() ->
  lists:max([ {concat(N, I), N, I} || N <- lists:seq(1, 10000),
                                      I <- lists:seq(2, 9),
                                      length(concat(N, I)) == 9,
                                      concat(N, I) >= "918273645",
                                      utils:pandigital(concat(N, I))]).

concat(_, I) when I == 0 ->
  "";
concat(N, I) ->
  concat(N, I - 1) ++ integer_to_list(N * I).

start() ->
  io:format("~p ~n", [f()]).