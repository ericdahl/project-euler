-module(p044).

-export([start/0]).

pents(N) when N == 0 ->
  [];

pents(N) ->
  pents(N - 1) ++ [N * (3 * N - 1) div 2].

f(N) ->
  Pents = pents(N),
  SPents = sets:from_list(Pents),
  lists:min([ abs(K - J) || J <- Pents,
                            K <- Pents,
                            K > J,
                            sets:is_element(J + K, SPents),
                            sets:is_element(K - J, SPents) ]).

start() ->
  io:format("~p ~n", [f(5000)]).

