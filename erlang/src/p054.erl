-module(p054).

-export([start/0]).

hand([{10,_S}, {11,_S}, {12,_S}, {13,_S}, {14,_S}]) -> {9, 0, 0, 0, royal};

hand([{V1,_S}, {V2,_S}, {V3,_S}, {V4,_S}, {V5,_S}]) when V5 == V4 + 1 andalso V4 == V3 + 1 andalso V3 == V2 + 1 andalso V2 == V1 + 1 -> {8, V5, 0, 0, sflush};

hand([{V,_}, {V,_}, {V,_}, {V,_}, {V5,_}]) -> {7, V, V5, 0, fkind};
hand([{V1,_}, {V,_}, {V,_}, {V,_}, {V,_}]) -> {7, V, V1, 0, fkind};

hand([{V,_}, {V,_}, {V,_}, {V2,_}, {V2,_}]) -> {6, V, V2, 0, fhouse};
hand([{V,_}, {V,_}, {V2,_}, {V2,_}, {V2,_}]) -> {6, V2, V, 0, fhouse};

hand([{_V1,_S}, {_V2,_S}, {V3,_S}, {V4,_S}, {V5,_S}]) -> {5, V5, V4, V3, flush};

hand([{V1,_}, {V2,_}, {V3,_}, {V4,_}, {V5,_}]) when V5 == V4 + 1 andalso V4 == V3 + 1 andalso V3 == V2 + 1 andalso V2 == V1 + 1 -> {4, V5, 0, 0, straight};

hand([{V,_}, {V,_}, {V,_}, {V2,_}, {V3,_}]) -> {3, V, V3, V2, tkind};
hand([{V1,_}, {V,_}, {V,_}, {V,_}, {V2,_}]) -> {3, V, V2, V1, tkind};
hand([{V1,_}, {V2,_}, {V,_}, {V,_}, {V,_}]) -> {3, V, V2, V1, tkind};

hand([{V1,_}, {V1,_}, {V2,_}, {V2,_}, {V,_}]) -> {2, V2, V1, V, twopair};
hand([{V1,_}, {V1,_}, {V,_}, {V2,_}, {V2,_}]) -> {2, V2, V1, V, twopair};
hand([{V,_}, {V1,_}, {V1,_}, {V2,_}, {V2,_}]) -> {2, V2, V1, V, twopair};


hand([{V,_}, {V,_}, {_V1,_}, {V2,_}, {V3,_}]) -> {1, V, V3, V2, onepair};
hand([{_V1,_}, {V,_}, {V,_}, {V2,_}, {V3,_}]) -> {1, V, V3, V2, onepair};
hand([{_V1,_}, {V2,_}, {V,_}, {V,_}, {V3,_}]) -> {1, V, V3, V2, onepair};
hand([{_V1,_}, {V2,_}, {V3,_}, {V,_}, {V,_}]) -> {1, V, V3, V2, onepair};

hand([{_V1,_}, {V2,_}, {V3,_}, {V4,_}, {V5,_}]) -> {V5, V4, V3, V2}.

parse_value("A") -> 14;
parse_value("K") -> 13;
parse_value("Q") -> 12;
parse_value("J") -> 11;
parse_value("T") -> 10;
parse_value(Str) -> hd(Str) - $0.

parse_suit(Str) -> Str.
parse_card(Str) -> {parse_value(string:substr(Str, 1, 1)), parse_suit(string:substr(Str, 2, 1))}.
parse(Str) -> lists:sort([parse_card(Token) || Token <- string:tokens(Str, " ")]).

read_games() ->
  {_, Data} = file:read_file("../resources/p054_poker.txt"),
  Lines = [binary_to_list(BLine) || BLine <- binary:split(Data, [<<"\n">>], [global])],
  [ {parse(string:substr(Line, 1, 14)), parse(string:substr(Line, 16))} || Line <- Lines ].

f([]) -> 0;
f([Game|Games]) ->
  case hand(element(1, Game)) > hand(element(2, Game)) of
    true -> 1 + f(Games);
    false -> f(Games)
  end.

start() ->
  io:format("~p ~n", [f(read_games())]).
