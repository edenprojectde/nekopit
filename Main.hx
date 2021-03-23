package;

import util.Database;
import pages.BlogPage;
import pages.IndexPage;
import util.Server.ServingServer;

class Main {
  static public function main():Void {
    var myServer = new ServingServer();
    //myServer.serve("get","/hellothere",(req,res)->{
    //  res.send("Hello there ;)");
    //});
    
    myServer.autoRegisterPages([
      new IndexPage(),
      new BlogPage()
    ]);
    myServer.generateFiles();
    myServer.listen(3001,()->{
      trace("Server started");
    });

    var db = new Database();
    db.connect("./db.ffdb");
    trace("Database Version "+db.get('version')+".0V");

    //db.setTyped("getFloaty", 125.7);
    var getFloaty : Float = db.getTyped("getFloaty");

    //db.setTyped("indexpagey", new IndexPage());
    var indexPagey : IndexPage = db.getTyped("indexpagey");

    db.save();
    trace(getFloaty);
    trace(indexPagey);
  }
}
/**
@:jsRequire('express', 'Express')
extern class Express {
  public function listen(port: Int): Void;
}
**/