-module(p011).

-export([start/0]).

f() ->
  {_, Data} = file:read_file("../resources/p011_grid.txt"),
  Lines = binary:split(Data, [<<"\n">>], [global]),
  Grid = [ [ utils:binary_to_integer(B) || B <- binary:split(Line, [<<" ">>], [global]) ] || Line <- Lines],
  lists:max([ max(Grid, Row, Col) || Row <- lists:seq(1, length(Grid)), Col <- lists:seq(1, length(Grid)) ]).

max(Grid, Row, Col) ->
  R = lists:foldl(fun(Incr, Acc) -> Acc * pos(Grid, Row, Col + Incr) end, 1, lists:seq(0, 3)),
  C = lists:foldl(fun(Incr, Acc) -> Acc * pos(Grid, Row + Incr, Col) end, 1, lists:seq(0, 3)),
  D1 = lists:foldl(fun(Incr, Acc) -> Acc * pos(Grid, Row + Incr, Col + Incr) end, 1, lists:seq(0, 3)),
  D2 = lists:foldl(fun(Incr, Acc) -> Acc * pos(Grid, Row + Incr, Col - Incr) end, 1, lists:seq(0, 3)),
  lists:max([R, C, D1, D2]).

pos(Grid, Row, _Col) when Row < 1 orelse Row > length(Grid) -> 1;
pos(Grid, _Row, Col) when Col < 1 orelse Col > length(Grid) -> 1;

pos(Grid, Row, Col) ->
  lists:nth(Col, lists:nth(Row, Grid)).

start() ->
  io:format("~p ~n", [f()]).

