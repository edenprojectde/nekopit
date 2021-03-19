package util;

import util.serverHelper.HTTPServer;
import lib.bases.BasePage;

interface IServer {
  public function serve(method:String, path:String, callback:(req:Dynamic, res:Dynamic)->Void) : Void;
  public function listen(port : Int , callback: ()->Void) : Void;
}

class ServingServer implements IServer {
  #if js
    var serverInstance: Dynamic;
  #end
  #if hl
    var serverInstance: HTTPServer;
  #end
    
  var something:Array<String> = ["Hello", "Array"];

  public function new() {
    #if js
      trace("Hello World JS 9 "+ something.join(', '));
      var express: Dynamic = js.Lib.require('express');
      serverInstance = express();

      
    #end

    #if hl
      trace("Hello World Hashlink");

      serverInstance = new HTTPServer();
      trace(serverInstance.existsing);
      //Todo implement Hashlink SocketServer :shrug:
    #end
  }

	public function listen(port:Int, callback:() -> Void) {
    #if js
      serverInstance.listen(3001, ()->{ 
        trace("Server running on port 3001");
      });
    #end
    #if hl
     trace(serverInstance.existsing);
      serverInstance.listen();
    #end
  }

  public function autoRegisterPages(pages: Array<AbstractPage>) {
    this.Pages = pages;
    addPagesToServerRoutes(pages);
  }

  public function addPagesToServerRoutes(pages: Array<AbstractPage>) {
    for (index => value in pages) {
      //if()
      #if js
      this.serverInstance.get(value.DynamicPath,(req,res)->{
        res.send(value.GenerateHTML());
      });
      #end
    }
  }

	public function serve(method:String, path:String, callback:(req:Dynamic, res:Dynamic) -> Void) {
    #if js
      this.serverInstance.get(path,callback);
    #end
  }

  public function addStaticFolder(method:String, path:String, callback:(req:Dynamic, res:Dynamic) -> Void) {
    #if js
      
      
    #end
  }

	public function generateFiles() {
    for (index => value in Pages) {
      //if()
      value.WriteToDisk();
    }
  }

	var Pages:Array<AbstractPage>;
}