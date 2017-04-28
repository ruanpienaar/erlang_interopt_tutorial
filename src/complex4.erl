-module(complex4).
-export([foo/1, bar/1]).

foo(X) ->
    call_cnode({foo, X}).
bar(Y) ->
    call_cnode({bar, Y}).

% CNodeLongname = cnode@example.com

call_cnode(Msg, CNodeLongname) ->

    % {RegName, Node} ! Msg
    {any, CNodeLongname} ! {call, self(), Msg},

    receive
    {cnode, Result} ->
        Result
    end.