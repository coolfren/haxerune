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
                frames = FlxAtlasFrames.fromTexturePackerJson('assets/characters/KrisBattle.png', Assets.getText('assets/characters/KrisBattle.json'));
                setGraphicSize(Std.int(width * 2));
                animation.addByPrefix('Idle', 'Idle', 5, true);
            case 'susie':
                frames = FlxAtlasFrames.fromTexturePackerJson('assets/characters/SusieBattle.png', Assets.getText('assets/characters/SusieBattle.json'));
                setGraphicSize(Std.int(width * 2));
                animation.addByPrefix('Idle', 'Idle', 5, true);
            case 'ralsei':
                frames = FlxAtlasFrames.fromTexturePackerJson('assets/characters/RalseiBattle.png', Assets.getText('assets/characters/RalseiBattle.json'));
                setGraphicSize(Std.int(width * 2));
                animation.addByPrefix('Idle', 'Idle', 5, true);
        }
        animation.play('Idle');
    }
}