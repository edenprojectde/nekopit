package util;

import haxe.macro.Expr.Error;

class Request {
  public static function SimpleRequest(url:String, returnType:ReturnType)
	{
		#if js
		var fetch:Dynamic = js.Lib.require('sync-fetch');
		if (returnType == JSON) {
			return fetch(url).json();
		}
		if (returnType == TEXT) {
			return fetch(url);
		}
    throw new haxe.exceptions.PosException("Something went wrong.");
		#end

    throw new haxe.exceptions.NotImplementedException();
	}
}

enum ReturnType {
	JSON;
	TEXT;
}
