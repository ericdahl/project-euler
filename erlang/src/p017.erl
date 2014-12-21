-module(p017).

-export([start/0]).

f() ->
  D = dict:from_list([
    {1, "one"},
    {2, "two"},
    {3, "three"},
    {4, "four"},
    {5, "five"},
    {6, "six"},
    {7, "seven"},
    {8, "eight"},
    {9, "nine"},
    {10, "ten"},
    {11, "eleven"},
    {12, "twelve"},
    {13, "thirteen"},
    {14, "fourteen"},
    {15, "fifteen"},
    {16, "sixteen"},
    {17, "seventeen"},
    {18, "eighteen"},
    {19, "nineteen"},
    {20, "twenty"},
    {30, "thirty"},
    {40, "forty"},
    {50, "fivty"},
    {60, "sixty"},
    {70, "seventy"},
    {80, "eighty"},
    {90, "ninety"},
    {100, "hundred"},
    {1000, "thousand"}
  ]),
  lists:sum([ length(strip(name(N, D))) || N <- lists:seq(1, 1000) ]).

strip(Word) ->
  re:replace(Word, "[\s-]", "", [global, {return, list}]).

name(N, D) when N =< 20 ->
  dict:fetch(N, D);
name(N, D) when N rem 10 == 0, N =< 90 ->
  dict:fetch(N, D);
name(N, D) when N rem 1000 == 0 ->
  dict:fetch(N div 1000, D) ++ " " ++ dict:fetch(1000, D);
name(N, D) when N rem 100 == 0 ->
  dict:fetch(N div 100, D) ++ " " ++ dict:fetch(100, D);
name(N, D) when N >= 100 ->
  dict:fetch(N div 100, D) ++ " " ++ dict:fetch(100, D) ++ " and " ++ name(N rem 100, D);
name(N, D) ->
  dict:fetch(N div 10 * 10, D) ++ "-" ++ dict:fetch(N rem 10, D).

start() ->
  io:format("~p ~n", [f()]).

