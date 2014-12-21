#!/usr/bin/env escript

main([String]) ->
  true = code:add_pathz("ebin/"),
  M = element(2, code:load_abs("ebin/" ++ String)),
  TimeMillis = element(1, timer:tc(M, start, [])) div 1000,
  io:format("~p  ~p ~n", [String, TimeMillis]),
  3;

main(_) ->
  usage().

usage() ->
  io:format("usage: run module-name\n"),
  halt(1).
