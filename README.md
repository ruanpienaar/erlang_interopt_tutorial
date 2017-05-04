# erlang_interopt_tutorial
A example erlang port driver repo

<!-- TODO: reword the data/complex/example naming convention, so that we talk about
1) port
2) erl_interface
3) linked-in port drivers
4) c nodes
5) NIFs -->

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
$ sudo dtrace -F -s dtrace_extprg1_pid.d `ps aux | grep extprg1 | grep -v grep | awk '{print $2 }'`
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

# Example 3 ( complex5 / example_drv.so )
```
$ ./start-dev.sh
erl> complex5:start("example_drv").
erl> complex5:foo(3).
```

# Tracing the linked-in driver as part of the vm/emulator/beam.smp
```
$ sudo dtrace -n 'pid$target:beam.smp:*driver*:entry { trace(execname) }' -p `ps aux | grep beam.smp | grep erlang_interopt_tutorial | awk '{ print $2 }'`
```

OR

```
$ PID=`ps aux | grep beam.smp | grep erlang_interopt_tutorial | awk '{ print $2 }'` && sudo dtrace -x ustackframes=100 -n 'pid$target:beam.smp:*driver*:entry /pid== '"${PID}"'/ { ustack();  }' -p $PID
```

# Example 4 ( complex3, complex4 ) C Node - C Server Sname
```
$ ./priv/cserver 3456
$ ./start-dev.sh
erl> complex3:foo(3).
```

# Tracing Example 4 - trace execname
```
$ sudo dtrace -F -s dtrace_cserver.d
$ ./priv/cserver2 3456
$ ./start-dev.sh
erl> complex3:foo(3).
```

# Tracing Example 4 - trace cserver PID
```
$ ./priv/cserver 3456
$ sudo dtrace -F -s dtrace_cserver_pid.d -p `ps aux | grep cserver | grep -v grep | awk '{print $2 }'`
$ ./start-dev.sh
erl> complex3:foo(3).
```

# Example 5 ( complex3, complex4 ) C Node - C Server Lname
```
$ ./priv/cserver2 3456
$ ./start-dev.sh
erl> complex4:foo(3).
```

# Tracing Example 5 - trace execname
```
$ sudo dtrace -F -s dtrace_cserver2.d
$ ./priv/cserver2 3456
$ ./start-dev.sh
erl> complex4:foo(3).
```


# Tracing Example 5 - trace cserver PID
( TODO: not working at the mo... )
```
$ ./priv/cserver2 3456
$ sudo dtrace -F -s dtrace_cserver2_pid.d -p `ps aux | grep cserver2 | grep -v grep | awk '{print $2 }'`
$ ./start-dev.sh
erl> complex4:foo(3).
```

# Example 6 ( complex3, complex4 ) C Node - C Client
```
$ ./start-sname-cnode.sh
$ ./priv/cclient
erl> complex3:foo(3).
```

# Tracing Example 6 - trace execname
```
$ sudo dtrace -F -s dtrace_cclient.d
$ ./start-sname-cnode.sh
$ ./priv/cclient
```

# Tracing Example 6 - trace C client PID
( TODO: also not working at the mo... )
```
$ ./start-sname-cnode.sh
$ ./priv/cclient
$ sudo dtrace -F -s dtrace_cclient_pid.d -p `ps aux | grep cclient | grep -v grep | awk '{print $2 }'`
```

# Example 7 ( NIFs )

```
$ ./start-dev.sh
erl> complex6:foo(2).
```

# Tracing Example 7 - Tracing the nif code as part of the beam.smp
( TODO: trace driver and nif, it seems the NIF uses some driver stuff )
```
$ ./start-dev.sh
$ PID=`ps aux | grep beam.smp | grep erlang_interopt_tutorial | awk '{ print $2 }'` && sudo dtrace -x ustackframes=100 -n 'pid$target:beam.smp:*nif*:entry /pid== '"${PID}"'/ { ustack();  }' -p $PID
erl> complex6:foo(2).
```


# References:
http://erlang.org/doc/tutorial/introduction.html
