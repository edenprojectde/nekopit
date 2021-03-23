package pages;

import js.node.http.IncomingMessage;
import js.node.http.ServerResponse;
import pieces.DebugPiece;
import haxe.Serializer;
import util.Minimize;
import util.Request;
import lib.bases.BasePage;

class BlogPage extends ApiPage {
  public function new() {
    this.APIPath = [
    ];
    
    TemplateFile = "./pages/Blog.mtt";

    #if js
    DynamicPath = "/blog/:slug";
    FilePath = "./blog.html";
    #end

    super();

  }

  override function ReadTemplateFromDisk():String {
    return super.ReadTemplateFromDisk();
  }

  override public function GenerateHTMLPerParameter(paremeterObj:ParameterObj):Null<String> {
    if(paremeterObj.res != null){
      paremeterObj.res.statusCode=200;}
    this.Data.set("path",paremeterObj.RequestPath);
    return this.GenerateHTML();
  }

  override function match(pathRequested:String):Bool {
    trace((~/\/blog/).match(pathRequested));
    return (~/\/blog/).match(pathRequested);
  }
}