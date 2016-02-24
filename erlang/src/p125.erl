-module(p125).

-export([start/0]).

-define(LIMIT, 100000000).

f() ->
  lists:sum(sets:to_list(g(1))).

g(I) when I > 10000 -> sets:new();
g(I) -> g(I, I + 1).
g(I, J) -> g(I, J, I * I + J * J).
g(I, _J, Candidate) when Candidate > ?LIMIT -> g(I + 1);
g(I, J, Candidate) ->
  Next = Candidate + (J + 1) * (J + 1),
  case utils:palindrome(Candidate) of
    true -> sets:add_element(Candidate, g(I, J + 1, Next));
    false -> g(I, J + 1, Next)
  end.


start() ->
  io:format("~p~n", [f()]).

