.PHONY: compile get-deps update-deps test clean deep-clean

compile: compile-complex1 get-deps update-deps
	@rebar compile

compile-complex1:
	@cd complex1_c_src && gcc -o ../priv/extprg complex.c erl_comm.c port.c

compile-complex2:
	@cd complexs_c_src && gcc -o ../priv/extprg complex.c erl_comm.c port.c

get-deps:
	@rebar get-deps

update-deps:
	@rebar update-deps

clean:
	rm ebin/*
	@rebar clean

deep-clean: clean
	@rebar delete-deps

setup_dialyzer:
	dialyzer --build_plt --apps erts kernel stdlib runtime_tools syntax_tools deps/*/ebin ./ebin
	dialyzer --add_to_plt ebin

dialyzer: compile
	dialyzer ebin

analyze: checkplt
	@rebar skip_deps=true dialyze

buildplt: setup_dialyzer
	@rebar skip_deps=true build-plt

checkplt: buildplt
	@rebar skip_deps=true check-plt