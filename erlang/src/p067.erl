-module(p067).

-export([start/0]).

f() ->
  {_, Data} = file:read_file("../resources/p067_triangle.txt"),
  Lines = binary:split(Data, [<<"\n">>], [global]),
  Tree = [ [ binary_to_integer(B) || B <- binary:split(Line, [<<" ">>], [global]) ] || Line <- Lines],
  max_path(hd(Tree), tl(Tree)).

max_path(Sums, []) -> lists:max(Sums);
max_path(Sums, [L|Tree]) ->
  First = hd(Sums) + hd(L),
  Last = lists:last(Sums) + lists:last(L),
  Middle = squash(lists:sublist(L, 2, length(L) - 2), Sums),
  max_path([ First | Middle ] ++ [ Last ], Tree).

squash([], _R) -> [];
squash([I|L], [J|R]) ->
  [ I + max(J, hd(R)) ] ++ squash(L, R).

start() ->
  io:format("~p ~n", [f()]).
