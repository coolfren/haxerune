package;

import openfl.utils.Assets;
import flixel.FlxSprite;
using StringTools;
#if cpp
import sys.io.File;
import sys.FileSystem;
#end
class Tiles extends FlxSprite{
    public var Type:String;
    var animations:Array<String>;
    public function new(tilename:String, tilesheet:String, ?X:Float = 0, ?Y:Float = 0, Type:String = "normal"){
        super(X,Y);
        this.Type = Type;
        loadGraphic('assets/tiles/$tilename.png');
    }
}