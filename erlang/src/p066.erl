-module(p066).

-export([start/0]).

f() ->
  element(2, lists:max([ {pell(D), D} || D <- lists:seq(2, 1000), not is_square(D) ])).

pell(D) -> pell(D, 1, 1, 1, 0).

pell(_D, _P, K, X1, Y) when K == 1 andalso Y /= 0 ->
  X1;

pell(D, P, K, X, Y) ->
  Tmp = K * (P div K + 1) - P,
  P_Next = Tmp - K * trunc((Tmp - math:sqrt(D)) / K),
  X_Next = (P_Next * X + D * Y) div abs(K),
  Y_Next = (P_Next * Y + X) div abs(K),
  K_Next = (P_Next * P_Next - D) div K,
  pell(D, P_Next, K_Next, X_Next, Y_Next).

is_square(N) ->
  Root = trunc(math:sqrt(N)),
  Root * Root == N.

start() ->
  io:format("~p ~n", [f()]).

