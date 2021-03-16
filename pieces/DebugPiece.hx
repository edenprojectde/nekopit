package pieces;

import haxe.Json;

class DebugPiece {
  var DataObj:Dynamic;

  public function new(dataObj:Dynamic) {
    DataObj = dataObj;
  }

  public function generateHTML() {
    return "
    <div class='debug'>
      "+Json.stringify(DataObj)+"
    </div>
    ";
  }
}