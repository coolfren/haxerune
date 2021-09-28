package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.Assets;

class FightChar extends FlxSprite{
    public var paeth:String;
    public function new(?X:Float=0, ?Y:Float=0) {
        super(X, Y); 
        paeth = 'assets/characters/KrisBattle';
        frames = FlxAtlasFrames.fromTexturePackerJson('assets/characters/KrisBattle.png', Assets.getText('assets/characters/KrisBattle.json'));
        setGraphicSize(Std.int(width * 3));
        animation.addByPrefix('Idle', 'Idle', 5, true);
        animation.play('Idle');
    }
}