package util;

class File {
  public static function WriteFile(path: String, content: String) {
    #if js

      var fs: Dynamic = js.Lib.require('fs-extra');
      fs.writeFileSync(path,content,"utf8");

      
    #end
  }
}