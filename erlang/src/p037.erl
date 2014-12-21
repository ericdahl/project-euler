-module(p037).

-export([start/0]).

f() ->
  Primes = utils:primes(900000),
  SPrimes = sets:from_list(Primes),
  lists:sum([ N || N <- Primes, N > 7, g(integer_to_list(N), SPrimes), h(integer_to_list(N), SPrimes) ]).

g([H], SPrimes) -> 
  sets:is_element(H - $0, SPrimes);

g([_|T], SPrimes) ->
  prime(T, SPrimes) andalso g(T, SPrimes).

h(L, SPrimes) when length(L) < 2 -> 
  prime(L, SPrimes);

h(S, SPrimes) ->
  prime(S, SPrimes) andalso h(element(1, lists:split(length(S) - 1, S)), SPrimes).

prime(S, SPrimes) ->
  sets:is_element(element(1, string:to_integer(S)), SPrimes).

start() ->
  io:format("~p ~n", [f()]).

