-module(p104).

-export([start/0]).

f() -> fib().

fib() -> fib(3, 1, 1).
fib(N, I, J) ->
  K = I + J,
  LastPan = fast_pan(K rem utils:pow(10, 9)),
  if
    LastPan ->
      FirstPan = utils:pandigital(lists:sublist(integer_to_list(K), 9)),
      if
        FirstPan -> N;
        true -> fib(N + 1, J, K)
      end;
    true -> fib(N + 1, J, K)
  end.

fast_pan(N) -> fast_pan(N, false, false, false, false, false, false, false, false, false).

fast_pan(0, true, true, true, true, true, true, true, true, true) -> true;
fast_pan(N, _One, Two, Three, Four, Five, Six, Seven, Eight, Nine) when N rem 10 == 1 -> fast_pan(N div 10, true, Two, Three, Four, Five, Six, Seven, Eight, Nine);
fast_pan(N, One, _Two, Three, Four, Five, Six, Seven, Eight, Nine) when N rem 10 == 2 -> fast_pan(N div 10, One, true, Three, Four, Five, Six, Seven, Eight, Nine);
fast_pan(N, One, Two, _Three, Four, Five, Six, Seven, Eight, Nine) when N rem 10 == 3 -> fast_pan(N div 10, One, Two, true, Four, Five, Six, Seven, Eight, Nine);
fast_pan(N, One, Two, Three, _Four, Five, Six, Seven, Eight, Nine) when N rem 10 == 4 -> fast_pan(N div 10, One, Two, Three, true, Five, Six, Seven, Eight, Nine);
fast_pan(N, One, Two, Three, Four, _Five, Six, Seven, Eight, Nine) when N rem 10 == 5 -> fast_pan(N div 10, One, Two, Three, Four, true, Six, Seven, Eight, Nine);
fast_pan(N, One, Two, Three, Four, Five, _Six, Seven, Eight, Nine) when N rem 10 == 6 -> fast_pan(N div 10, One, Two, Three, Four, Five, true, Seven, Eight, Nine);
fast_pan(N, One, Two, Three, Four, Five, Six, _Seven, Eight, Nine) when N rem 10 == 7 -> fast_pan(N div 10, One, Two, Three, Four, Five, Six, true, Eight, Nine);
fast_pan(N, One, Two, Three, Four, Five, Six, Seven, _Eight, Nine) when N rem 10 == 8 -> fast_pan(N div 10, One, Two, Three, Four, Five, Six, Seven, true, Nine);
fast_pan(N, One, Two, Three, Four, Five, Six, Seven, Eight, _Nine) when N rem 10 == 9 -> fast_pan(N div 10, One, Two, Three, Four, Five, Six, Seven, Eight, true);
fast_pan(_N, _One, _Two, _Three, _Four, _Five, _Six, _Seven, _Eight, _Nine) -> false.


start() ->
  io:format("~p ~n", [f()]).
