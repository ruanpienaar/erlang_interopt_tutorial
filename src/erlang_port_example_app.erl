-module(erlang_port_example_app).

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
    {ok,Pid} = erlang_port_example_sup:start_link(),
    PortPid = complex1:start(code:priv_dir(erlang_port_example)++"/extprg"),
    io:format("extprg started as Port pid:~p~n", [PortPid]),
    {ok, Pid}.
    

stop(_State) ->
    ok.