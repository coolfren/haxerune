package;

import openfl.utils.Assets;
import flixel.FlxSprite;
using StringTools;
#if cpp
import sys.io.File;
import sys.FileSystem;
#end
class Tiles extends FlxSprite{
    var animations:Array<String>;
    public var type:String = '';
    public function new(tilename:String, tilesheet:String, ?X:Float = 0, ?Y:Float = 0, ?type:String){
        super(X,Y);
        this.type = type;
        loadGraphic('assets/tiles/$tilename.png');
    }
}