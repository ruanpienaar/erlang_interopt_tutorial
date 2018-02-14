syscall:::
/execname == "extprg1"/
{
    printf("%s %d %d %d %d %d %d %d %d %d %d", execname, arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
    trace(execname)
}