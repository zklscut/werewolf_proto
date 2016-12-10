-module(conver_proto_to_b).

-export([start/0]).

start() ->
    {ok, Read} = file:open("game_pb.hrl", read),
    {ok, Write} = file:open("b_proto_route.erl", write),
    io:format(Write, "-module(b_proto_route).~n", []),
    io:format(Write, "-export([get/1]).~n~n", []),

    read(file:read_line(Read), Read, Write),
    file:close(Read),
    file:close(Write),
    halt().

read({ok, Data}, Read, Write) ->
    try
        [_, Record, _, MsgId | _T] = string:tokens(Data, " (,{=}"),
        [_, M, F, _] = re:split(Record, "__", [{return, list}]),

        io:format(Write, "get(~s) -> {~s, ~s, ~s}; ~n", [MsgId, Record, "mod_" ++ M, F])
    catch 
        _:_ ->
            ignore
    end,
    read(file:read_line(Read), Read, Write);
read(eof, _Read, Write) ->
    io:format(Write, "get(_) -> undefined. ~n", []).





    