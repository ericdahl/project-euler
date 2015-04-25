-module(p065).

-export([start/0]).

f() ->
  lists:sum([ I - $0 || I <- integer_to_list(h(gen_list(0), 2, 1))]).

gen_list(99) -> [];
gen_list(I) when (I - 1) rem 3 == 0 -> [2 * (I div 3 + 1) | gen_list(I + 1)];
gen_list(I) -> [1 | gen_list(I + 1)].

h([], N, _D) -> N;
h([I|L], N, D) -> h(L, I * N + D, N).

start() ->
  io:format("~p ~n", [f()]).

