#!/bin/sh
# complex3.erl
cd `dirname $0`
exec erl -sname c1@localhost -pa $PWD/ebin $PWD/deps/*/ebin $PWD/test -boot start_sasl -setcookie erlang_interopt_tutorial