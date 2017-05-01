#!/bin/sh
# complex4.erl
cd `dirname $0`
exec erl -name cnode@localhost -pa $PWD/ebin $PWD/deps/*/ebin $PWD/test -boot start_sasl -setcookie erlang_interopt_tutorial