package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.Assets;

class FightChar extends FlxSprite{
    public var paeth:String;
    public function new(?X:Float=0, ?Y:Float=0, ?char:String = 'kris') {
        super(X, Y); 
        //Player.hx with changes ig
        switch(char){
            case 'kris':
                frames = Paths.fromJson('assets/characters/KrisBattle');
                trace(frames.frames.length);
                setGraphicSize(Std.int(width * 2));
                animation.addByPrefix('Idle', 'Idle', 5, true);
            case 'susie':
                frames = Paths.fromJson('assets/characters/SusieBattle');
                setGraphicSize(Std.int(width * 2));
                animation.addByPrefix('Idle', 'Idle', 5, true);
            case 'ralsei':
                frames = Paths.fromJson('assets/characters/RalseiBattle');
                setGraphicSize(Std.int(width * 2));
                animation.addByPrefix('Idle', 'Idle', 5, true);
        }
        animation.play('Idle');
    }
}