# erlang_port_example
A example erlang port driver repo

# Getting started
```
$ git clone https://github.com/ruanpienaar/erlang_port_example
$ make
$ ./start-dev.sh
erl> complex1:foo(1).
```

References: 
http://erlang.org/doc/tutorial/introduction.html

# external (extprg) tracing

```
$ sudo dtrace -F -s extprg_trace.d
erl> complex1:foo(1).
erl> complex1:bar(2).
```