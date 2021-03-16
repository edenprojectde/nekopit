package util;

class Minimize {
  public static function RemoveNewLines(str: String) : String {
    return StringTools.replace(str,'\n','');
  }

  public static function RemoveDoubleSpaces(str: String, repetitions:Int = 1) : String {
    if(repetitions<=0) {
      while(str.indexOf("  ")!=-1)
        str = StringTools.replace(str,'  ',' ');
      
    } else {
      for (i in 0...repetitions) {
        str = StringTools.replace(str,'  ',' ');
      }
    }
    return str;
  }
  public static function RemoveTabs(str: String) : String {
    str = StringTools.replace(str,'\t','');

    return str;
  }

  public static function HTML(html: String) : String {
    return RemoveTabs(RemoveDoubleSpaces(RemoveNewLines(html),-1));
  }
}