-module(test).

-include_lib("include/test_pb.hrl").

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-export([valid_new/0, inv_new/0, id/1]).

valid_new() ->
    %% 64 bits
    #test_pb{id = 16#ffffffffffffffff}.

inv_new() ->
    %% 72 bits
    #test_pb{id = 16#fffffffffffffffff}.

id(#test_pb{id = ID}) -> ID.

%% ------------------------------------------------------------------
%% EUNIT Tests
%% ------------------------------------------------------------------
-ifdef(TEST).

valid_test() ->
    Test = valid_new(),
    Decoded = test_pb:decode_msg(test_pb:encode_msg(Test), test_pb),
    ?assertEqual(id(Test), id(Decoded)).

invalid_test() ->
    Test = inv_new(),
    %% XXX: We expect this to blow up but it does not!
    Decoded = test_pb:decode_msg(test_pb:encode_msg(Test), test_pb),
    ?assertEqual(id(Test), id(Decoded)).

-endif.
