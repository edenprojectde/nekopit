package lib.bases;

import js.node.http.IncomingMessage;
import js.node.http.ServerResponse;
import util.Routing.IRoutingMatchable;
import haxe.Exception;
import util.Minimize;
import haxe.Template;
import util.Request;

abstract class AbstractPage implements IRoutingMatchable {
  public var DynamicPath: String;
  public var BasePath = ".";
  public var FilePath: Null<String>;
  public var Template="<div>Empty</div>";
  public var TemplateFile:Null<String>;
  public var GenerateMode:GenerateMode = LiveGeneration;

  public function new() {};
  /**
    Optional HTML Generation
    @returns (?String)
  **/
  public abstract function GenerateHTML() : Null<String>;
  public abstract function GenerateHTMLPerHTTPParameter(req: IncomingMessage, res:ServerResponse) : Null<String>;
  public abstract function GenerateHTMLPerParameter(parameterObj:ParameterObj) : Null<String>;
  /**
    Template into Template Object
  **/
  public abstract function GenerateTemplate(): Template;
  public abstract function WriteToDisk(): Void;
}


class BasePage extends AbstractPage {
  public var HTMLHeader : Array<String> = [
    '<meta charset="UTF-8">',
    '<meta http-equiv="X-UA-Compatible" content="IE=edge">',
    '<meta name="viewport" content="width=device-width, initial-scale=1.0">'
  ];

	public function GenerateHTML():Null<String> { throw new haxe.exceptions.NotImplementedException();	}
	public function GenerateTemplate():Template {	throw new haxe.exceptions.NotImplementedException();
	}

  public function match(pathRequested:String):Bool { throw new haxe.exceptions.NotImplementedException();	}

	public function GenerateHTMLPerHTTPParameter(req:IncomingMessage, res:ServerResponse) : Null<String> 
    { var parameterObj = new ParameterObj(req.url);
      parameterObj.req=req;
      parameterObj.res=res;
      return this.GenerateHTMLPerParameter(
                  parameterObj
                ); }
  public function GenerateHTMLPerParameter(parameterObj:ParameterObj) : Null<String> 
    { return this.GenerateHTML(); }

  /**
    Filename and path is based of FilePath
  **/
	public function WriteToDisk() {
    #if js
      var fs:Dynamic = js.Lib.require('fs-extra');

      if(FilePath != null)
      {
        fs.ensureDirSync("./out");
        fs.writeFileSync(haxe.io.Path.join(["./out", FilePath]), GenerateHTML());
      }
    #end
    #if hl

    #end
  }

  public function ReadTemplateFromDisk() : String {
    #if js
      var fs:Dynamic = js.Lib.require('fs-extra');

      return fs.readFileSync(TemplateFile); // POSSIBLE PROBLEM, could not return String if file does not exist
    #end
    #if hl

    #end
  }

	
}

class StaticFileGeneratedPage extends BasePage{
	override public function GenerateHTML() { 
    try
    {
      return Minimize.HTML(this.GenerateTemplate().execute({headers:HTMLHeader}));
    } //  + new DebugPiece({data:Data}).generateHTML()
    catch (e) {
      try {
        return this.GenerateTemplate().execute({});
      } catch(e2) {
        return Minimize.HTML("
          <div> No Data in this Element <br> Maybe we also got a problem:
          <pre style='width:400px; white-space: normal;'>
            "+e.toString()+"<br>
            "+e.message+"<br>
            "+e.stack.toString()+"
          </pre></div>
        ");
      }
      
    }
  }

	public override function GenerateTemplate():Template {
    try {
		  if(TemplateFile != null) {
        var content = ReadTemplateFromDisk();

        return new haxe.Template(content.toString());
      }
    }
    throw new Exception("Can not generate HTML");
	}
  override public function ReadTemplateFromDisk() : String {
    #if js
      var fs:Dynamic = js.Lib.require('fs-extra');

      return fs.readFileSync(TemplateFile); // POSSIBLE PROBLEM, could not return String if file does not exist
    #end
    #if hl

    #end
  }
}

class ApiPage extends StaticFileGeneratedPage implements IAPI {
  public function new() {
    super();
    this.GenerateMode = GenerateSingleton;
    this.GatherData();
  }

  override public function GenerateHTML() { 
    try
    {
      return Minimize.HTML(this.GenerateTemplate().execute({data:Data, headers:HTMLHeader}));
    } //  + new DebugPiece({data:Data}).generateHTML()
    catch (e) {
      try {
        return this.GenerateTemplate().execute({data:Data});
      } catch(e2) {
        return Minimize.HTML("
          <div> No Data in this Element <br> Maybe we also got a problem:
          <pre style='width:400px; white-space: normal;'>
            "+e.toString()+"<br>
            "+e.message+"<br>
            "+e.stack.toString()+"
          </pre></div>
        ");
      }
      
    }
  }

	public var APIPath:Map<String,String>;

	public function GatherData() {
    trace("Trying.. "+APIPath);
    #if js
    for (key => value in APIPath) {
      var request:Dynamic = Request.SimpleRequest(value,JSON);
      this.Data[key] = request;
      //trace(request);
    }
    #end
  };

	public var Data:Map<String,Any> = new Map<String,Any>();

}

/**
  maybe redundant?
**/
class MultiApiPage extends ApiPage {

}

interface IBackend {
  public var BackEndFields: Map<String,BaseBackEndPiece>;
  public function GenerateBackEndTemplate(): Template;
  public function GenerateBackEndHTML(): String;
}

class BaseBackEndPiece extends AbstractPage {
  public var DataFields: Dynamic;

	public function GenerateHTML():Null<String> {
		throw new haxe.exceptions.NotImplementedException();
	}

	public function GenerateTemplate():Template {
		throw new haxe.exceptions.NotImplementedException();
	}

	public function WriteToDisk() {}

	public function match(pathRequested:String):Bool {
		throw new haxe.exceptions.NotImplementedException();
	}

	public function GenerateHTMLPerHTTPParameter(req:IncomingMessage, res:ServerResponse):Null<String> {
		return this.GenerateHTML();
	}
  public function GenerateHTMLPerParameter(parameterObj:ParameterObj) : Null<String> {
    return this.GenerateHTML();
  }
}

interface IAPI {
  public var APIPath:Map<String,String>;
  public var Data:Map<String,Any>;
  public function GatherData() : Void ;
}

/**
  LiveOnlyStaticFile => Link to a static file
  LiveGeneration => Generate Page dynamically (like in PHP)
  Generate Singleton => Create the site on the initial start of the Server && serve this file en route. /index.html e.x.
  Generate Multiton => Generate a whole table, one page per row and serve them in a subfolder. /blog/blog-entry.html e.x.
**/
enum GenerateMode {
  LiveOnlyStaticFile;
  LiveGeneration;
  GenerateSingleton;
  GenerateMultiton;
}

class ParameterObj {
  public var RequestPath ="";
  public var req:Null<IncomingMessage>;
  public var res:Null<ServerResponse>;
  public function new(requestPath) {
    this.RequestPath=requestPath;
  }
}