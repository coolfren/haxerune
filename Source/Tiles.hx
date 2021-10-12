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
    public function new(tilename:String, tilesheet:String, ?X:Float = 0, ?Y:Float = 0){
        super(X,Y);
        loadGraphic('assets/tiles/$tilename.png');
        //animations = coolTextFile('assets/tiles/$tilesheet.txt');
        //trace(animations);
        /*for(i in 0...animations.length){
            if(animations[i] == 'path'){
                frames = Paths.fromJson(animations[i + 1]);
                // replace them so it doesnt get mistaken for smth else
                animations[i + 1] = 'uwu';
            }
        }
        for(i in 0...animations.length){
            var curline:Array<String> = animations[i].split(' ');
            switch(animations[i]){
                case 'animation': 
                    animation.addByPrefix(animations[i + 1], animations[i + 2], Std.parseInt(animations[i + 3]), (animations[i + 4] == 'true'), false, false);
                    animations[i + 1] = 'uwu';
                    animations[i + 2] = 'uwu';
                    animations[i + 3] = 'uwu';
                    animations[i + 4] = 'uwu';
                    //h
                case 'uwu':
                    //trace('line $i has been replaced as to not fuck this shit up');
            }
        }*/
        //setGraphicSize(Std.int(width * 1.13));
       // updateHitbox();
    }
}