-module(p018).

-export([start/0]).

f() ->
  {_, Data} = file:read_file("../resources/p018_tree.txt"),
  Lines = binary:split(Data, [<<"\n">>], [global]),
  Tree = [ [ binary_to_integer(B) || B <- binary:split(Line, [<<" ">>], [global]) ] || Line <- Lines],
  max_path(Tree, 1, 1).

max_path(Tree, Row, _Col) when Row > length(Tree) -> 0;
max_path(Tree, Row, Col) ->
  pos(Tree, Row, Col) + max(max_path(Tree, Row + 1, Col), max_path(Tree, Row + 1, Col + 1)).

pos(Tree, Row, Col) ->
  lists:nth(Col, lists:nth(Row, Tree)).

start() ->
  io:format("~p ~n", [f()]).

