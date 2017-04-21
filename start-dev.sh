#!/bin/sh

# -mnesia dir "'"$PWD"/Mnesia'"

cd `dirname $0`
exec erl -sname erlang_port_example -config $PWD/sys.config -pa $PWD/ebin $PWD/deps/*/ebin $PWD/test -boot start_sasl -setcookie erlang_port_example -run erlang_port_example_app start