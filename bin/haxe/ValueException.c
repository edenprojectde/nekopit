﻿// Generated by HLC 4.2.1 (HL v4)
#define HLC_BOOT
#include <hlc.h>
#include <haxe/ValueException.h>
String Std_string(vdynamic*);
void haxe_Exception_new(haxe__Exception,String,haxe__Exception,vdynamic*);

void haxe_ValueException_new(haxe__ValueException r0,vdynamic* r1,haxe__Exception r2,vdynamic* r3) {
	String r5;
	r5 = Std_string(r1);
	haxe_Exception_new(((haxe__Exception)r0),r5,r2,r3);
	r0->value = r1;
	return;
}

vdynamic* haxe_ValueException_unwrap(haxe__ValueException r0) {
	vdynamic *r1;
	r1 = r0->value;
	return r1;
}

