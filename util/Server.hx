package util;

import lib.bases.BasePage.AbstractPage;
import util.serverHelper.HTTPServer;

interface IServer {
  public function serve(method:String, path:String, callback:(req:Dynamic, res:Dynamic)->Void) : Void;
  public function listen(port : Int , callback: ()->Void) : Void;
}

class ServingServer extends Routing<AbstractPage> implements IServer {
  var serverInstance: HTTPServer;
    
  var something:Array<String> = ["Hello", "Array"];

  public function new() {
      super();
      trace("Hello World Hashlink");

      serverInstance = new HTTPServer();
      trace(serverInstance.existsing);
  }

	public function listen(port:Int, callback:() -> Void) {
    #if js
      serverInstance.listen(3001, this, ()->{ 
        trace("Server running on port 3001");
      });
    #end
    #if hl
     trace(serverInstance.existsing);
      serverInstance.listen();
    #end
  }

  public function autoRegisterPages(pages: Array<AbstractPage>) {
    Pages = pages;
    for (index => value in pages) {
      registerRoute(value.DynamicPath,value);
    }
  }

	//public function serve(method:String, path:String, callback:(req:Dynamic, res:Dynamic) -> Void) {
  //  registerRoute(path, )
  //}

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

	public function serve(method:String, path:String, callback:(req:Dynamic, res:Dynamic) -> Void) {}
}