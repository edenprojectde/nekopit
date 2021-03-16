﻿// Generated by HLC 4.2.1 (HL v4)
#define HLC_BOOT
#include <hlc.h>
#include <sys/net/_Socket/SocketInput.h>
#include <hl/natives.h>
#include <haxe/io/Error.h>
#include <haxe/io/Eof.h>
extern venum* g$haxe_io_Error_Blocked;
vdynamic* haxe_Exception_thrown(vdynamic*);
extern hl_type t$haxe_io_Eof;
void haxe_io_Eof_new(haxe__io__Eof);

void sys_net__Socket_SocketInput_new(sys__net___Socket__SocketInput r0,sys__net__Socket r1) {
	r0->sock = r1;
	return;
}

int sys_net__Socket_SocketInput_readByte(sys__net___Socket__SocketInput r0) {
	venum *r7;
	sys__net__Socket r3;
	hl_socket *r2;
	haxe__io__Eof r8;
	vdynamic *r6;
	int r1, r5;
	r3 = r0->sock;
	if( r3 == NULL ) hl_null_access();
	r2 = r3->__s;
	r1 = hl_socket_recv_char(r2);
	r5 = 0;
	if( r1 >= r5 ) goto label$e6436f9_2_15;
	r5 = -1;
	if( r1 != r5 ) goto label$e6436f9_2_11;
	r7 = (venum*)g$haxe_io_Error_Blocked;
	r6 = haxe_Exception_thrown(((vdynamic*)r7));
	hl_throw((vdynamic*)r6);
	label$e6436f9_2_11:
	r8 = (haxe__io__Eof)hl_alloc_obj(&t$haxe_io_Eof);
	haxe_io_Eof_new(r8);
	r6 = haxe_Exception_thrown(((vdynamic*)r8));
	hl_throw((vdynamic*)r6);
	label$e6436f9_2_15:
	return r1;
}

