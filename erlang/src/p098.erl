-module(p098).

-export([start/0]).


f() ->
  lists:max([ val(A, B) || {A, B} <- [ {W, hd(N)} || {_, [W|N]} <- dict:to_list(anagrams(words())) ] ]).

words() ->
  {_, Data} = file:read_file("../resources/p098_words.txt"),
  [ string:substr(N, 2, string:len(N) - 2) || N <- [ binary_to_list(N) || N <- binary:split(Data, [<<",">>], [global]) ]].

anagrams(Words) ->  dict:filter(fun(_K, V) -> length(V) > 1 end, anagram_dict(Words)).

anagram_dict([]) -> dict:new();
anagram_dict([W|Words]) -> dict:append(lists:sort(W), W, anagram_dict(Words)).

val(A, B) ->
  Squares = sets:from_list([ integer_to_list(N * N) || N <- lists:seq(1, 1000)]),
  Options = [ S || S <- sets:to_list(Squares), string:len(S) == string:len(A) ],
  Results = [ convert(A, B, Sq) || Sq <- Options, sets:is_element(convert(A, B, Sq), Squares),  sets:is_element(convert(A, A, Sq), Squares) ],
  lists:max([ list_to_integer(R) || R <- ["0"|Results] ]).

convert(InWord, OutWord, Square) -> apply_dict(OutWord, letter_dict(InWord, Square)).

% convert something like "CARE", 1296 to {C -> 1, A -> 2, R -> 9, E -> 6}
letter_dict(W, N) when is_integer(N) -> letter_dict(W, integer_to_list(N));
letter_dict([], []) -> dict:new();
letter_dict([L|W], [D|N]) -> dict:store(L, D, letter_dict(W, N)).

% from letter_dict, apply result to a different word to form digits
apply_dict(W, D) ->
  % verify no letter has two values
  UniqueValues = sets:from_list([ V || {_K, V} <- dict:to_list(D) ]),
  case sets:size(UniqueValues) /= dict:size(D) of
    true -> "0";
    false -> [ dict:fetch(L, D) || L <- W ]
  end.

start() ->
  io:format("~p ~n", [f()]).




