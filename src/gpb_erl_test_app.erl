%%%-------------------------------------------------------------------
%% @doc gpb_erl_test public API
%% @end
%%%-------------------------------------------------------------------

-module(gpb_erl_test_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    gpb_erl_test_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
