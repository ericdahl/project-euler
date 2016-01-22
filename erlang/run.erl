#!/usr/bin/env escript

main([Args]) ->
  true = code:add_pathz("ebin/"),
  {_, M} = code:load_abs("ebin/" ++ Args),
  case M of
      nofile -> 0;
      _ -> 
        TimeMillis = element(1, timer:tc(M, start, [])) div 1000,
        io:format("~p  ~p ~n", [Args, TimeMillis])
  end;
  

main(_) ->
  usage().

usage() ->
  io:format("usage: run module-name\n"),
  halt(1).
