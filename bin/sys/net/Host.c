﻿// Generated by HLC 4.2.1 (HL v4)
#define HLC_BOOT
#include <hlc.h>
#include <sys/net/Host.h>
#include <_std/SysError.h>
#include <hl/natives.h>
extern hl_type t$SysError;
extern String s$Unresolved_host_;
String String___add__(String,String);
void SysError_new(SysError,String);
vdynamic* haxe_Exception_thrown(vdynamic*);
String sys_net_Host_toString(sys__net__Host);
String String_fromUTF8(vbyte*);

void sys_net_Host_new(sys__net__Host r0,String r1) {
	String r2;
	SysError r9;
	vdynamic *r8;
	int *r5;
	vbyte *r4;
	int r3, r7;
	r0->host = r1;
	if( r1 == NULL ) hl_null_access();
	r4 = r1->bytes;
	r3 = 0;
	r5 = NULL;
	r4 = hl_utf16_to_utf8(r4,r3,r5);
	r3 = hl_host_resolve(r4);
	r0->ip = r3;
	r3 = r0->ip;
	r7 = -1;
	if( r3 != r7 ) goto label$a9ced3d_1_17;
	r9 = (SysError)hl_alloc_obj(&t$SysError);
	r2 = (String)s$Unresolved_host_;
	r2 = String___add__(r2,r1);
	SysError_new(r9,r2);
	r8 = haxe_Exception_thrown(((vdynamic*)r9));
	hl_throw((vdynamic*)r8);
	label$a9ced3d_1_17:
	return;
}

vbyte* sys_net_Host___string(sys__net__Host r0) {
	String r2;
	vbyte *r1;
	r2 = sys_net_Host_toString(r0);
	if( r2 == NULL ) hl_null_access();
	r1 = r2->bytes;
	return r1;
}

String sys_net_Host_toString(sys__net__Host r0) {
	String r1;
	int r3;
	vbyte *r2;
	r3 = r0->ip;
	r2 = hl_host_to_string(r3);
	r1 = String_fromUTF8(r2);
	return r1;
}

