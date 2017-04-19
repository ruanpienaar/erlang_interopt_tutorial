/*Filename : c
  Author   : Ruan Pienaar
  Created  : Fri 19 Apr 2017 15:59:13 BST
*/

// C includes
#include <stdio.h>

// Erlang includes
#include <erl_driver.h>
#include <ei.h>
// #include <map>
// #include <set>

// port driver include
#include "erl_sqlite.h"

/* Callbacks */
// static ErlDrvEntry example_erlang_port_entry = {
//     example_erlang_port_init,                 /* init */
//     example_erlang_port_start,                       /* startup (defined below) */
//     example_erlang_port_stop,                        /* shutdown (defined below) */
//     NULL,                               /* output */
//     example_erlang_port_ready_input,                 /* ready_input */
//     NULL,                               /* ready_output */
//     (char*)"example_erlang_port_drv",                   /* driver name */
//     NULL,                               /* finish */
//     NULL,                               /* handle */
//     NULL,                               /* control */
//     NULL,                               /* timeout */
//     example_erlang_port_outputv,                     /* outputv, binary output */
//     NULL,                               /* ready_async */
//     NULL,                               /* flush */
//     NULL,                               /* call */
//     NULL,                               /* event */
//     ERL_DRV_EXTENDED_MARKER,            /* ERL_DRV_EXTENDED_MARKER */
//     ERL_DRV_EXTENDED_MAJOR_VERSION,     /* ERL_DRV_EXTENDED_MAJOR_VERSION */
//     ERL_DRV_EXTENDED_MAJOR_VERSION,     /* ERL_DRV_EXTENDED_MINOR_VERSION */
//     ERL_DRV_FLAG_USE_PORT_LOCKING,      /* ERL_DRV_FLAGs */
//     NULL,                               /* handle2 (reserved */
//     example_erlang_port_process_exit,                /* process_exit */
//     NULL                                /* stop_select */
// };

// int main(int argc, char* argv[]){
//   example_erlang_port_init();
// }


// static int example_erlang_port_init(void){
//     erl_init(NULL, 0);
//     return 0;
// }


// DRIVER_INIT(example_erlang_port){
//     return &example_erlang_port_entry;
// }

