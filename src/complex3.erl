-module(complex3).
-export([foo/1, bar/1]).

foo(X) ->
    call_cnode({foo, X}, cnode_sname(1)).
bar(Y) ->
    call_cnode({bar, Y}, cnode_sname(1)).

cnode_sname(Instance) ->
    {ok,H} = inet:gethostname(),
    list_to_atom("c"++integer_to_list(Instance)++"@"++H).

% CNodeShortname = c1@localhost
% If short node names are used, the plain name of the node is cN, where N is an integer.

call_cnode(Msg, CNodeShortname) ->

    % {RegName, Node} ! Msg
    {any, CNodeShortname} ! {call, self(), Msg},

    receive
    {cnode, Result} ->
        Result
    end.