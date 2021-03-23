package util;

class File {
  public static function WriteFile(path: String, content: String) {
    #if js

      var fs: Dynamic = js.Lib.require('fs-extra');
      fs.writeFileSync(path,content,"utf8");

      
    #end
  }

  public static function ReadFile(path: String): String {
    #if js

      var fs: Dynamic = js.Lib.require('fs-extra');
      return fs.readFileSync(path,"utf8").toString();

      
    #end
  }

  public static function ReadOrCreateFile(path: String): String {
    #if js

      var fs: Dynamic = js.Lib.require('fs-extra');
      fs.ensureFileSync(path);
      return fs.readFileSync(path,"utf8").toString();

      
    #end
  }
}