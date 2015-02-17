-module(p081).

-export([start/0]).

f() ->
  {_, Data} = file:read_file("../resources/p081_matrix.txt"),
  Lines = binary:split(Data, [<<"\n">>], [global]),
  Matrix = [ [ binary_to_integer(B) || B <- binary:split(Line, [<<",">>], [global]) ] || Line <- Lines],
  Tree = rotate(Matrix) ++ fill(Matrix),
  min_path(hd(Tree), tl(Tree)).

rotate(L1) -> [ rotate(L1, Level, length(L1)) || Level <- lists:seq(1, length(L1)) ].
rotate(L, Level, Max) -> rotate(L, 1, Level, Level, Max).
rotate(_L, I, _J, Level, _Max) when I > Level -> [];
rotate(L, I, J, Level, Max) -> [lists:nth(I, lists:nth(J, L)) | rotate(L, I + 1, J - 1, Level, Max)].

fill(L) -> [ lists:duplicate(J - 1, 10000) ++ fill(L, length(L), J) ++ lists:duplicate(J - 1, 10000) || J <- lists:seq(2, length(L))].
fill(L, _I, J) when J > length(L) -> [];
fill(L, I, J) -> [lists:nth(J, lists:nth(I, L)) | fill(L, I - 1, J + 1)].

min_path(Sums, []) -> lists:min(Sums);
min_path(Sums, [L|Tree]) ->
  First = hd(Sums) + hd(L),
  Last = lists:last(Sums) + lists:last(L),
  Middle = squash(lists:sublist(L, 2, length(L) - 2), Sums),
  min_path([ First | Middle ] ++ [ Last ], Tree).

squash([], _R) -> [];
squash([I|L], [J|R]) ->
  [ I + min(J, hd(R)) ] ++ squash(L, R).

start() ->
  io:format("~p ~n", [f()]).
