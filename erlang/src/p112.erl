-module(p112).

-export([start/0]).

f() ->
  find_ratio(1, 0).

find_ratio(N, BouncyCount) ->
  IsBouncy = is_bouncy(N),
  NewBouncyCount = BouncyCount + if IsBouncy -> 1; true -> 0 end,
  Ratio = NewBouncyCount / N,
  if
    Ratio == 0.99 -> N;
    true -> find_ratio(N + 1, NewBouncyCount)
  end.


is_bouncy(N) when N < 100 -> false;
is_bouncy(N) -> is_bouncy(N div 10, N rem 10, neutral).

is_bouncy(N, _PrevLastDigit, _Dir) when N == 0 -> false;
is_bouncy(N, PrevLastDigit, Dir) ->
  LastDigit = N rem 10,
  if
    Dir == inc andalso LastDigit > PrevLastDigit -> true;
    Dir == dec andalso LastDigit < PrevLastDigit -> true;
    LastDigit > PrevLastDigit -> is_bouncy(N div 10, LastDigit, dec);
    LastDigit < PrevLastDigit -> is_bouncy(N div 10, LastDigit, inc);
    LastDigit == PrevLastDigit -> is_bouncy(N div 10, LastDigit, Dir);
    true -> is_bouncy(N div 10, LastDigit, neutral)
  end.

start() ->
  io:format("~p ~n", [f()]).
