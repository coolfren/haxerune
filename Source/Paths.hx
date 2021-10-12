package;

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
}