﻿// Generated by HLC 4.2.1 (HL v4)
#ifndef INC_haxe___Template__TemplateExpr
#define INC_haxe___Template__TemplateExpr
typedef struct _haxe___Template__$TemplateExpr *haxe___Template__$TemplateExpr;
#include <hl/Enum.h>
#include <hl/BaseType.h>
#include <_std/String.h>
#include <hl/natives.h>
#include <hl/types/ArrayObj.h>
#include <haxe/_Template/TemplateExpr.h>
#include <haxe/ds/List.h>


struct _haxe___Template__$TemplateExpr {
	hl_type *$type;
	hl_type* __type__;
	vdynamic* __meta__;
	varray* __implementedBy__;
	String __ename__;
	hl_bytes_map* __emap__;
	hl__types__ArrayObj __constructs__;
	varray* __evalues__;
};
typedef struct {
	HL__ENUM_CONSTRUCT__
	String p0;
} haxe__Template_TemplateExpr_OpVar;
typedef struct {
	HL__ENUM_CONSTRUCT__
	vclosure* p0;
} haxe__Template_TemplateExpr_OpExpr;
typedef struct {
	HL__ENUM_CONSTRUCT__
	vclosure* p0;
	venum* p1;
	venum* p2;
} haxe__Template_TemplateExpr_OpIf;
typedef struct {
	HL__ENUM_CONSTRUCT__
	String p0;
} haxe__Template_TemplateExpr_OpStr;
typedef struct {
	HL__ENUM_CONSTRUCT__
	haxe__ds__List p0;
} haxe__Template_TemplateExpr_OpBlock;
typedef struct {
	HL__ENUM_CONSTRUCT__
	vclosure* p0;
	venum* p1;
} haxe__Template_TemplateExpr_OpForeach;
typedef struct {
	HL__ENUM_CONSTRUCT__
	String p0;
	haxe__ds__List p1;
} haxe__Template_TemplateExpr_OpMacro;
#endif

