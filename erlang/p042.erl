-module(p042).

-export([start/0]).

f() ->
  Tri = tri(1, 1000),
  {_, Data} = file:read_file("../resources/p042_words.txt"),
  L = binary:split(Data, [<<",">>], [global]),
  Words = [re:replace(binary_to_list(I), "\"", "", [global, {return, list}]) || I <- L],
  length([Word || Word <- Words, sets:is_element(sum(Word), Tri)]).

sum(Word) ->
  lists:foldl(fun(Letter, Sum) -> Letter - $A + 1 + Sum end, 0, Word).

tri(N, Max) when N > Max ->
  sets:new();

tri(N, Max) ->
  sets:add_element(N * (N + 1) div 2, tri(N + 1, Max)).


start() ->
  io:format("~p ~n", [f()]).
