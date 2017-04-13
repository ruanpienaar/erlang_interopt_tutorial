-module(erlang_port_example_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

-include("erlang_port_example.hrl").

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    erlang_port_example_sup:start_link().

stop(_State) ->
    ok.
