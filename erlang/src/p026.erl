-module(p026).

-export([start/0]).

f() ->
  element(2, lists:max([ {len(I), I} || I <- lists:seq(2, 999) ])).

len(N) -> len(N, 1, 1, dict:new()).

len(_N, D, _I, _Dict) when D == 0 -> 0;
len(N, D, I, Dict) when D < N -> len(N, D * 10, I, Dict);
len(N, D, I, Dict) ->
  Rem = D rem N,
  case dict:is_key(Rem, Dict) of
    true -> I - dict:fetch(Rem, Dict);
    false -> len(N, D rem N, I + 1, dict:store(Rem, I, Dict))
  end.

start() ->
  io:format("~p ~n", [f()]).
