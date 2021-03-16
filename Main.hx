package;

import pages.IndexPage;
import util.Server.ServingServer;

class Main {
  static public function main():Void {
    var myServer = new ServingServer();
    myServer.serve("get","/hellothere",(req,res)->{
      res.send("Hello there ;)");
    });
    myServer.autoRegisterPages([new IndexPage()]);
    myServer.generateFiles();
    myServer.listen(3001,()->{
      trace("Server started");
    });
  }
}
/**
@:jsRequire('express', 'Express')
extern class Express {
  public function listen(port: Int): Void;
}
**/