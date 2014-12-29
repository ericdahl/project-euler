-module(p055).

-export([start/0]).

f() ->
  length(lists:filter(fun(N) -> lychrel(N) end, lists:seq(1, 10000))).

lychrel(N) -> lychrel(N, 50).

lychrel(_N, I) when I == 0 -> true;
lychrel(N, I) ->
  Next = N + element(1, string:to_integer(lists:reverse(integer_to_list(N)))),
  not utils:palindrome(Next) andalso lychrel(Next, I - 1).

start() ->
  io:format("~p ~n", [f()]).