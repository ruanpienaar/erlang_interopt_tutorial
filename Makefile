.PHONY: compile get-deps update-deps test clean deep-clean

compile: compile-complex5 compile-complex2 compile-complex1 get-deps update-deps
	@rebar compile

compile-complex1:
	@cd complex1_c_src && gcc -o ../priv/extprg1 complex.c erl_comm.c port.c

compile-complex2:
	@cd complex2_c_src \
	&& gcc -I "`which erl | xargs dirname | xargs -I dir find "dir/../lib/" -type d -name "erl_interface*"`/include" \
	-L"`which erl | xargs dirname | xargs -I dir find "dir/../lib/" -type d -name "erl_interface*"`/lib" \
	-o ../priv/extprg2 \
	../complex1_c_src/complex.c ../complex1_c_src/erl_comm.c ei.c \
	-l erl_interface -l ei

compile-complex5:
	@cd complex5_c_src && gcc -g -Wall -DDEBUG  -dynamiclib -undefined dynamic_lookup -I "`which erl | xargs dirname`/../usr/include" \
	-o ../priv/example_drv.so -fpic -shared ../complex1_c_src/complex.c port_driver.c

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