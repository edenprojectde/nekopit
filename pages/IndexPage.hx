package pages;

import pieces.DebugPiece;
import haxe.Serializer;
import util.Minimize;
import util.Request;
import lib.bases.BasePage;

class IndexPage extends ApiPage {
  public function new() {
    this.APIPath = [
      "People" => "https://jsonware.com/json/16658074778e770dfccbc51d64f134a2.json",
      "Places" =>"https://jsonware.com/json/16658074778e770dfccbc51d64f134a2.json"
    ];
    
    TemplateFile = "./pages/Index.mtt";

    #if js
    DynamicPath = "/";
    FilePath = "./index.html";
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


}