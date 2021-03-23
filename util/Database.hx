package util;

import haxe.macro.Expr.Error;
import haxe.Unserializer;
import haxe.Serializer;
import haxe.io.Bytes;
import haxe.crypto.Base64;
import haxe.Json;

class Database {
    private var databasecontent : Map<String,String> = new Map<String,String>();
    public var Filepath : String;
    public function new() {

    }
    public function connect(filename: String) {
        Filepath = filename;
        load();
        databasecontent.set('version',"1.0");
        save();
    }

    @:generic public function getTyped<T>(name: String) : T {
        if(databasecontent[name] == null) throw new haxe.Exception("Value is not in database");

        var unserializer = new Unserializer(databasecontent[name]);
        return (unserializer.unserialize():T);
    }
    public function setTyped(name: String, value: Dynamic) {
        var serializer = new Serializer();
        serializer.serialize(value);

        databasecontent.set(name,serializer.toString());
    }
    public function set(name: String, value: String) { databasecontent.set(name,value); }
    public function get(name:String) : String {
        if(databasecontent[name] == null) throw new haxe.Exception("Value is not in database");
        return databasecontent[name];
    }

    public function parseDatabase(data: String) : Map<String,String>{
        var mapdata = new Map<String,String>();

        var split1 = data.split(";");

        for (i in 0...split1.length) {
            var kvp = split1[i].split(':');
            if(kvp.length==2) 
            mapdata.set(Base64.decode(kvp[0]).toString(),Base64.decode(kvp[1]).toString());
        }

        return mapdata;
    }

    public function stringifyDatabase(data: Map<String,String>) : String{
        var stringDB = "";
        if(data!=null)
        for (key => value in data) {
            stringDB+=Base64.encode(Bytes.ofString(key))+":"+Base64.encode(Bytes.ofString(value))+";";
        }
        return stringDB;
    }

    public function save() {
        File.WriteFile(Filepath, stringifyDatabase(databasecontent));
    }

    public function load() {
        databasecontent = parseDatabase(File.ReadOrCreateFile(Filepath));
    }
}
