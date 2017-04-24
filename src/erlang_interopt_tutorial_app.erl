-module(erlang_interopt_tutorial_app).

-behaviour(application).

%% Application callbacks
-export([start/0, start/2, stop/1]).

-include("erlang_port_example.hrl").

%% ===================================================================
%% Application callbacks
%% ===================================================================

start() ->
    start(normal, permanent).

start(_StartType, _RestartType) ->
    erlang_interopt_tutorial_sup:start_link().    

stop(_State) ->
    ok.