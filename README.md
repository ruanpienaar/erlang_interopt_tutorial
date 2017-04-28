# erlang_interopt_tutorial
A example erlang port driver repo

# Getting started
```
$ git clone https://github.com/ruanpienaar/erlang_interopt_tutorial
$ make
```

# Example 1 ( complex1 / extprg1 )
```
$ ./start-dev.sh
erl> complex1:start(code:priv_dir(erlang_interopt_tutorial)++"/extprg1").
erl> complex1:foo(1).
```

### simple syscall dtrace
```
$ sudo dtrace -F -s extprg1_trace.d
erl> complex1:foo(1).
```

### A more detailed dtrace
```
$ sudo sudo dtrace -F -s dtrace_extprg1_pid.d `ps aux | grep extprg1 | grep -v grep | awk '{print $2 }'`
erl> complex1:foo(1).
```


# Example 2 ( complex 2 / extprg2 )
```
$ ./start-dev.sh
erl> complex2:start(code:priv_dir(erlang_interopt_tutorial)++"/extprg2").
erl> complex2:foo(3).
```

### simple syscall dtrace
```
$ sudo dtrace -F -s extprg2_trace.d
erl> complex2:foo(3).
```

### A more detailed dtrace
```
$ sudo dtrace -F -s dtrace_extprg2_pid.d `ps aux | grep extprg2 | grep -v grep | awk '{print $2 }'`
erl> complex2:foo(3).
```

# Example 3
```
$ ./start-dev.sh
erl> complex5:start("example_drv").
```

# References:
http://erlang.org/doc/tutorial/introduction.html
