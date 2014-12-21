-module(p036).

-export([start/0]).

f() ->
  lists:sum([N || N <- lists:seq(1, 1000000), pal(N), pal(bits_to_string(binary:encode_unsigned(N, big)))]).

bits_to_string(<<H:1, T/bitstring>>) when H == 0 -> bits_to_string(T);
bits_to_string(<<T/bitstring>>) -> h(T).

h(<<H:1, T/bitstring>>) -> integer_to_list(H) ++ h(T);
h(_) -> "".

pal(N) when is_integer(N) -> pal(integer_to_list(N));
pal(S) when is_list(S) -> lists:reverse(S) == S;
pal(N) when is_bitstring(N) -> bits_to_string(N) == lists:reverse(bits_to_string(N)).

start() ->
  io:format("~p ~n", [f()]).