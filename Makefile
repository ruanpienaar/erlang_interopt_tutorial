.PHONY: rebar3 compile clean

compile: compile-complex6 compile-complex3+4_client compile-complex3+4_longname compile-complex3+4_shortname compile-complex5 compile-complex2 compile-complex1
	@./rebar3 compile

compile-complex1:
	@cd complex1_c_src && gcc -o ../priv/extprg1 complex.c erl_comm.c port.c

compile-complex2:
	@cd complex2_c_src \
	&& gcc -I "`which erl | xargs dirname | xargs -I dir find "dir/../lib/" -type d -name "erl_interface*"`/include" \
	-L"`which erl | xargs dirname | xargs -I dir find "dir/../lib/" -type d -name "erl_interface*"`/lib" \
	-o ../priv/extprg2 \
	../complex1_c_src/complex.c ../complex1_c_src/erl_comm.c ei.c \
	-lpthread -l erl_interface -l ei

compile-complex3+4_shortname:
	@cd complex3+4_c_src && gcc -o ../priv/cserver -I "`which erl | xargs dirname | xargs -I dir find "dir/../lib/" -type d -name "erl_interface*"`/include" \
	-I "`which erl | xargs dirname | xargs -I dir find "dir/../lib/" -type d -name "erl_interface*"`/lib" \
	-L"`which erl | xargs dirname | xargs -I dir find "dir/../lib/" -type d -name "erl_interface*"`/lib" \
	../complex1_c_src/complex.c cnode_s.c -lerl_interface -lei

compile-complex3+4_longname:
	@cd complex3+4_c_src && gcc -o ../priv/cserver2 -I "`which erl | xargs dirname | xargs -I dir find "dir/../lib/" -type d -name "erl_interface*"`/include" \
        -I "`which erl | xargs dirname | xargs -I dir find "dir/../lib/" -type d -name "erl_interface*"`/lib" \
        -L"`which erl | xargs dirname | xargs -I dir find "dir/../lib/" -type d -name "erl_interface*"`/lib" \
        ../complex1_c_src/complex.c cnode_s2.c -lerl_interface -lei

compile-complex3+4_client:
	@cd complex3+4_c_src && gcc -o ../priv/cclient -I "`which erl | xargs dirname | xargs -I dir find "dir/../lib/" -type d -name "erl_interface*"`/include" \
        -I "`which erl | xargs dirname | xargs -I dir find "dir/../lib/" -type d -name "erl_interface*"`/lib" \
        -L"`which erl | xargs dirname | xargs -I dir find "dir/../lib/" -type d -name "erl_interface*"`/lib" \
        ../complex1_c_src/complex.c cnode_c.c -lerl_interface -lei

compile-complex5:
	@cd complex5_c_src && gcc -dynamiclib -undefined dynamic_lookup -I "`which erl | xargs dirname`/../usr/include" \
	-o ../priv/example_drv.so -fpic -shared ../complex1_c_src/complex.c port_driver.c

compile-complex6:
	@cd complex6_c_src && gcc -dynamiclib -undefined dynamic_lookup -I "`which erl | xargs dirname`/../usr/include" \
	 -o ../priv/complex6_nif.so -fpic -shared ../complex1_c_src/complex.c complex6_nif.c

clean:
	@./rebar3 clean

rebar3:
	@ls rebar3 || wget https://s3.amazonaws.com/rebar3/rebar3 && chmod +x rebar3