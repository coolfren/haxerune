package;
#if sys 
import sys.FileSystem;
#else
import openfl.Assets;
#end

import flixel.graphics.frames.FlxAtlasFrames;
class Paths{
    public static function getSparowAtlas(Path:String){
        ColorTraces.traceRed('loadin animations from $Path');
        return FlxAtlasFrames.fromSparrow(Path + '.png', Path + '.xml');
    }
    public static function fromJson(Path:String){
        ColorTraces.traceRed('loadin animations from $Path');
        return FlxAtlasFrames.fromTexturePackerJson(Path + '.png', Path + '.json');
    }
    public static function Music(Path:String) {
        Path = Path + ".ogg";
        ColorTraces.traceRed('loadin song from assets/mus/$Path \n');
        ColorTraces.traceRed('path exists = ' + exists("assets/mus/" + Path + "\n"));
        
        if(exists("assets/mus/" + Path)){
            return "assets/mus/" + Path;
        }else{
            return "assets/mus/doesntexistplace.ogg"; //basicly if the thing dont exist, we play this song instead
        }
    }
    public static function exists(Path:String){
        #if sys
        return FileSystem.exists(Path);
        #else
        return Assets.exists(Path);
        #end
    }
}