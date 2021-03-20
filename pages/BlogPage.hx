package pages;

import pieces.DebugPiece;
import haxe.Serializer;
import util.Minimize;
import util.Request;
import lib.bases.BasePage;

class BlogPage extends ApiPage {
  public function new() {
    this.APIPath = [
      "People" => "https://jsonware.com/json/16658074778e770dfccbc51d64f134a2.json",
      "Places" =>"https://jsonware.com/json/16658074778e770dfccbc51d64f134a2.json"
    ];
    
    TemplateFile = "./pages/Index.mtt";

    #if js
    DynamicPath = "/blog/:slug";
    FilePath = "./blog.html";
    #end

    super();

  }
	//override public function GenerateTemplate() : haxe.Template {
  //  var templ = new haxe.Template(
  //    /* <!--html--> */" 
  //    Test
  //    "/* <!--!html--> */);
  //    
  //  return templ;
  //}

  override function match(pathRequested:String):Bool {
    return pathRequested == DynamicPath || pathRequested == FilePath;
  }
}