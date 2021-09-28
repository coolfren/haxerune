package;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxGame;
import openfl.Assets;

class FightScene extends FlxState
{
    var BG:FlxSprite;
    var kris:FightChar;
    function new(){
        super();
        BG = new FlxSprite(-50,-50);
        BG.frames = FlxAtlasFrames.fromSparrow('assets/Animations/Bg_BATTLE_Animates.png', Assets.getText('assets/Animations/Bg_BATTLE_Animates.xml'));
        BG.animation.addByPrefix('BG_ANIMATION_SHIT','BG_ANIMATION_SHIT', 24, true);
        BG.animation.play('BG_ANIMATION_SHIT');

    }
    override function create() {
        super.create();
        kris = new FightChar(150, FlxG.height / 2);
        add(BG);
        add(kris);
    }
}