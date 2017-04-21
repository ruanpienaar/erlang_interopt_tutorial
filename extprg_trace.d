:::
/execname == "extprg" /
{
    printf("%s %d %d %d", execname, arg0, arg1, arg2);
    trace(execname)
}