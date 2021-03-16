﻿// Generated by HLC 4.2.1 (HL v4)
#define HLC_BOOT
#include <hlc.h>
#include <_std/Main.h>
extern hl_type t$vrt_441cb94;
extern hl_type t$fun_473eccf;
extern String s$Hello_there_;
#include <hl/types/ArrayDyn.h>
#include <haxe/Log.h>
extern haxe__$Log g$_haxe_Log;
extern String s$Server_started;
extern hl_type t$vrt_329ffa8;
extern String s$Main_hx;
extern hl_type t$String;
extern hl_type t$_i32;
extern String s$Main;
extern String s$main;
extern hl_type t$vrt_eaa6a3b;
#include <util/ServingServer.h>
#include <hl/types/ArrayObj.h>
#include <pages/IndexPage.h>
extern hl_type t$fun_b2092b4;
extern hl_type t$fun_7b48b4f;
extern hl_type t$util_ServingServer;
void util_ServingServer_new(util__ServingServer);
extern String s$get;
extern String s$_hellothere;
extern hl_type t$fun_3ea440a;
void util_ServingServer_serve(util__ServingServer,String,String,vclosure*);
extern hl_type t$lib_bases_AbstractPage;
#include <hl/natives.h>
extern hl_type t$pages_IndexPage;
void pages_IndexPage_new(pages__IndexPage);
hl__types__ArrayObj hl_types_ArrayObj_alloc(varray*);
void util_ServingServer_autoRegisterPages(util__ServingServer,hl__types__ArrayObj);
void util_ServingServer_generateFiles(util__ServingServer);
void util_ServingServer_listen(util__ServingServer,int,vclosure*);

void Main_main__$2(vclosure* r0,vdynamic* r1,vdynamic* r2) {
	vvirtual *r3;
	r3 = hl_to_virtual(&t$vrt_441cb94,(vdynamic*)r2);
	r0->hasValue ? ((void (*)(vdynamic*,vdynamic*,vvirtual*))r0->fun)((vdynamic*)r0->value,r1,r3) : ((void (*)(vdynamic*,vvirtual*))r0->fun)(r1,r3);
	return;
}

void Main_main__$1(vdynamic* r0,vvirtual* r1) {
	String r4;
	vclosure *r3;
	vdynamic *r2;
	if( r1 == NULL ) hl_null_access();
	r3 = hl_vfields(r1)[0] ? (*(vclosure**)(hl_vfields(r1)[0])) : (vclosure*)hl_dyn_getp(r1->value,206605906/*send*/,&t$fun_473eccf);
	if( r3 == NULL ) hl_null_access();
	r4 = (String)s$Hello_there_;
	r2 = r3->hasValue ? ((vdynamic* (*)(vdynamic*,String))r3->fun)((vdynamic*)r3->value,r4) : ((vdynamic* (*)(String))r3->fun)(r4);
	return;
}

void Main_main__$3() {
	String r3, r5;
	vvirtual *r4, *r7;
	haxe__$Log r2;
	vclosure *r1;
	int r6;
	r2 = (haxe__$Log)g$_haxe_Log;
	r1 = r2->trace;
	if( r1 == NULL ) hl_null_access();
	r3 = (String)s$Server_started;
	r4 = hl_alloc_virtual(&t$vrt_329ffa8);
	r5 = (String)s$Main_hx;
	if( hl_vfields(r4)[1] ) *(String*)(hl_vfields(r4)[1]) = (String)r5; else hl_dyn_setp(r4->value,37969014/*fileName*/,&t$String,r5);
	r6 = 13;
	if( hl_vfields(r4)[2] ) *(int*)(hl_vfields(r4)[2]) = (int)r6; else hl_dyn_seti(r4->value,371360620/*lineNumber*/,&t$_i32,r6);
	r5 = (String)s$Main;
	if( hl_vfields(r4)[0] ) *(String*)(hl_vfields(r4)[0]) = (String)r5; else hl_dyn_setp(r4->value,-63073762/*className*/,&t$String,r5);
	r5 = (String)s$main;
	if( hl_vfields(r4)[3] ) *(String*)(hl_vfields(r4)[3]) = (String)r5; else hl_dyn_setp(r4->value,302979532/*methodName*/,&t$String,r5);
	r7 = hl_to_virtual(&t$vrt_eaa6a3b,(vdynamic*)r4);
	r1->hasValue ? ((void (*)(vdynamic*,vdynamic*,vvirtual*))r1->fun)((vdynamic*)r1->value,((vdynamic*)r3),r7) : ((void (*)(vdynamic*,vvirtual*))r1->fun)(((vdynamic*)r3),r7);
	return;
}

void Main_main() {
	String r2, r3;
	hl__types__ArrayObj r6;
	hl_type *r8;
	util__ServingServer r0;
	vclosure *r4, *r5, *r11;
	pages__IndexPage r10;
	int r9;
	varray *r7;
	static vclosure cl$0 = { &t$fun_b2092b4, Main_main__$1, 0 };
	static vclosure cl$1 = { &t$fun_7b48b4f, Main_main__$3, 0 };
	r0 = (util__ServingServer)hl_alloc_obj(&t$util_ServingServer);
	util_ServingServer_new(r0);
	r2 = (String)s$get;
	r3 = (String)s$_hellothere;
	r4 = &cl$0;
	if( r4 ) goto label$36888b6_4_8;
	r5 = NULL;
	goto label$36888b6_4_9;
	label$36888b6_4_8:
	r5 = hl_alloc_closure_ptr(&t$fun_3ea440a,Main_main__$2,r4);
	label$36888b6_4_9:
	util_ServingServer_serve(r0,r2,r3,r5);
	r8 = &t$lib_bases_AbstractPage;
	r9 = 1;
	r7 = hl_alloc_array(r8,r9);
	r10 = (pages__IndexPage)hl_alloc_obj(&t$pages_IndexPage);
	pages_IndexPage_new(r10);
	r9 = 0;
	((pages__IndexPage*)(r7 + 1))[r9] = r10;
	r6 = hl_types_ArrayObj_alloc(r7);
	util_ServingServer_autoRegisterPages(r0,r6);
	util_ServingServer_generateFiles(r0);
	r9 = 3001;
	r11 = &cl$1;
	util_ServingServer_listen(r0,r9,r11);
	return;
}

