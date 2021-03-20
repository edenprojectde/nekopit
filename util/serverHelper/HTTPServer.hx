package util.serverHelper;


import lib.bases.BasePage;
#if hl
import haxe.io.Error;
import sys.net.Host;
import sys.net.Socket;
#end

class HTTPServer {
	public var existsing = "Yes";

	public function new() {}

	public function listen(port:Int, routes:Routing<AbstractPage>, callback:() -> Void) {
		#if js
		var server = js.node.Http.createServer((request, response) -> {
			var matched = routes.matchRoute(request.url);
			if(matched!=null) {
				response.write(matched.GenerateHTML());
			}
            response.write("Ugha + "+ request.url);
			response.end();
		});
		server.listen(3001);
		
		callback();
		#end

		#if hl
		var _aSocketDistant = new List<Socket>();

		var _oSocketMaster = new Socket();
		var _oSocketInfoHolding = new Map<String, SocketInformation>();
		_oSocketMaster.bind(new Host('localhost'), 8000);
		_oSocketMaster.setBlocking(false);
		_oSocketMaster.listen(9999);

		while (true) {
			// Accepting socket
			var oSocketDistant = _oSocketMaster.accept();
			if (oSocketDistant != null) {
				trace('opening : ' + oSocketDistant.peer());
				_oSocketInfoHolding[oSocketDistant.peer().host + "" + oSocketDistant.peer().port] = new SocketInformation();

				oSocketDistant.setBlocking(false);
				_aSocketDistant.add(oSocketDistant);
			}

			// Trying to read from each socket
			for (oSocketDistant in _aSocketDistant) {
				try {
					var line = oSocketDistant.input.readLine();

					/** This Variable is used to be able  to identify the Socket for the time of the Connection.
						The Data in it are Headers primarily.
					**/
					var crntHolding = _oSocketInfoHolding[oSocketDistant.peer().host + "" + oSocketDistant.peer().port];

					if (line != null)
						crntHolding.Response.write(line);

					if (line == "") {
						trace("BLANK LINE");

						oSocketDistant.write("HTTP/1.1 200\r\nContent-Type: text/html; charset=utf-8\r\n\r\n" + crntHolding.Response._Content + "\r\n");

						// oSocketDistant.waitForRead();
						oSocketDistant.close();

						// _oSocketInfoHolding[oSocketDistant.peer().host+""+oSocketDistant.peer().port]=null;

						crntHolding.Killable = true;
						_aSocketDistant.remove(oSocketDistant);
					}
				} catch (e:Dynamic) {
					if (e != Error.Blocked)
						throw e;
				}
			}
		}
		#end
	}
}

class SocketInformation {
	public function new() {};

	public var Request:RequestHeaders = new RequestHeaders();
	public var Response:Response = new Response();

	public var UUID:String;

	public var Killable = false;
}

abstract class BaseHeaders {
	public function new() {};

	private var _Headers:Map<String, String>;

	@:arrayAccess
	public inline function getHeader(name:String) {
		return _Headers[name];
	}

	@:arrayAccess
	public inline function setHeader(k:String, v:String) {
		this._Headers[k] = v;
		return v;
	}
}

class RequestHeaders extends BaseHeaders {}

class Response extends BaseHeaders {
	public var _Content:String = "";

	public function write(line:String) {
		_Content += line;
	};

	public function end(responseCode:Int = 200) {};
}
