-module(p004).

-export([start/0]).

p(N) ->
  L = integer_to_list(N),
  L == lists:reverse(L).

f() -> f(999, 999, 1).
f(1, 1, Max) -> Max;
f(1, J, Max) -> f(999, J - 1, Max);
f(I, J, Max) ->
  Pal = p(I * J),
  if
    not Pal -> f(I - 1, J, Max);
    true ->
      if
        I * J > Max -> f(I - 1, J, I * J);
        true -> f(I - 1, J, Max)
      end
  end.

start() ->
  io:format("~p ~n", [f()]).