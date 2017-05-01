#!/bin/sh
cd `dirname $0`
exec erl -sname erlang_interopt_tutorial -pa $PWD/ebin $PWD/deps/*/ebin $PWD/test -boot start_sasl -setcookie erlang_interopt_tutorial