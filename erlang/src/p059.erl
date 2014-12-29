-module(p059).

-export([start/0]).

f() ->
  {_, Data} = file:read_file("../resources/p059_cipher.txt"),
  Nums = [ binary_to_integer(N) || N <- binary:split(Data, [<<",">>], [global]) ],
  Keys = [ [A, B, C] || A <- lists:seq($a, $z), B <- lists:seq($a, $z), C <- lists:seq($a, $z) ],
  {_, Key} = lists:max(spaces(Nums, Keys)),
  lists:sum(decrypt(Nums, Key)).

spaces(_Nums, []) -> [];
spaces(Nums, [K|Keys]) ->
  Spaces = length([N || N <- decrypt(Nums, K), N == 32]),
  [{Spaces, K} | spaces(Nums, Keys)].

decrypt(Enc, Key) -> decrypt(Enc, Key, 0).

decrypt([], _Key, _N) -> [];
decrypt([H|Enc], Key, N) -> [H bxor lists:nth(N rem 3 + 1, Key) | decrypt(Enc, Key, N + 1)].

start() ->
  io:format("~p ~n", [f()]).