-module(p022).

-export([start/0]).

f() ->
  {_, Data} = file:read_file("../resources/p022_names.txt"),
  L = binary:split(Data, [<<",">>], [global]),
  Names = [re:replace(binary_to_list(I), "\"", "", [global, {return, list}]) || I <- L],
  SortedNamePositions = lists:zip(lists:sort(Names), lists:seq(1, length(Names))),
  lists:foldl(fun({Name, Position}, Total) -> Total + score(Name) * Position end, 0, SortedNamePositions).

score(Name) ->
  lists:foldl(fun(Letter, Total) -> Total + Letter - $A + 1 end, 0, Name).

start() ->
  io:format("~p ~n", [f()]).
