pid$1:::entry
/execname == "cserver"/
{
    self->trace = 1;
}

pid$1:::return
/self->trace/
{
    /* self->trace = 0; */
}

pid$1:::entry,
pid$1:::return
/self->trace/
{
}