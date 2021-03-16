﻿// Generated by HLC 4.2.1 (HL v4)
#define HLC_BOOT
#include <hlc.h>
#include <_std/StringTools.h>
#include <hl/types/ArrayObj.h>
hl__types__ArrayObj String_split(String,String);
String hl_types_ArrayObj_join(hl__types__ArrayObj,String);

String StringTools_replace(String r0,String r1,String r2) {
	String r3;
	hl__types__ArrayObj r4;
	if( r0 == NULL ) hl_null_access();
	r4 = String_split(r0,r1);
	if( r4 == NULL ) hl_null_access();
	r3 = hl_types_ArrayObj_join(r4,r2);
	return r3;
}

