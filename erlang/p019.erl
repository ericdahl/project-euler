-module(p019).

-export([start/0]).

f() ->
  length([ {Dow, Day, Month, Year} || {Dow, Day, Month, Year} <- g(31, december, 2000),
      Dow == sunday,
      Day == 1,
      Year >= 1901]).

g(Day, Month, Year) when Day == 1, Month == january, Year == 1900 ->
  [ {monday, 1, january, 1900} ];

g(Day, Month, Year) when Month == february, Day == 1 ->
  next_month(g(31, january, Year));
g(Day, Month, Year) when Month == march, Day == 1, Year rem 4 == 0, not Year rem 400 == 0 ->
  next_month(g(28, february, Year));
g(Day, Month, Year) when Month == march, Day == 1 ->
  next_month(g(28, february, Year));
g(Day, Month, Year) when Month == april, Day == 1 ->
  next_month(g(31, march, Year));
g(Day, Month, Year) when Month == may, Day == 1 ->
  next_month(g(30, april, Year));
g(Day, Month, Year) when Month == june, Day == 1 ->
  next_month(g(31, may, Year));
g(Day, Month, Year) when Month == july, Day == 1 ->
  next_month(g(30, june, Year));
g(Day, Month, Year) when Month == august, Day == 1 ->
  next_month(g(31, july, Year));
g(Day, Month, Year) when Month == september, Day == 1 ->
  next_month(g(31, august, Year));
g(Day, Month, Year) when Month == october, Day == 1 ->
  next_month(g(30, september, Year));
g(Day, Month, Year) when Month == november, Day == 1 ->
  next_month(g(31, october, Year));
g(Day, Month, Year) when Month == december, Day == 1 ->
  next_month(g(30, november, Year));
g(Day, Month, Year) when Year > 1900, Day == 1, Month == january ->
  next_year(g(31, december, Year - 1));
g(Day, Month, Year) ->
  next_day(g(Day - 1, Month, Year)).

next_day(Before) ->
  {Dow, Day, Month, Year} = lists:last(Before),
  Before ++ [{next(Dow), Day + 1, Month, Year}].

next_month(Before) ->
  {Dow, _, Month, Year} = lists:last(Before),
  Before ++ [{next(Dow), 1, next(Month), Year}].

next_year(Before) ->
  {Dow, _, _, Year} = lists:last(Before),
  Before ++ [{next(Dow), 1, january, Year + 1}].

next(monday) -> tuesday;
next(tuesday) -> wednesday;
next(wednesday) -> thursday;
next(thursday) -> friday;
next(friday) -> saturday;
next(saturday) -> sunday;
next(sunday) -> monday;

next(january) -> february;
next(february) -> march;
next(march) -> april;
next(april) -> may;
next(may) -> june;
next(june) -> july;
next(july) -> august;
next(august) -> september;
next(september) -> october;
next(october) -> november;
next(november) -> december;
next(december) -> january.

start() ->
  io:format("~p ~n", [f()]).

