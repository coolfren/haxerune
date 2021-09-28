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
    var susie:FightChar;
    var ralsei:FightChar;
    function new(){
        //just for fighting ig
        super();
        BG = new FlxSprite(-50,-50);
        BG.frames = FlxAtlasFrames.fromSparrow('assets/Animations/Bg_BATTLE_Animates.png', Assets.getText('assets/Animations/Bg_BATTLE_Animates.xml'));
        BG.animation.addByPrefix('BG_ANIMATION_SHIT','BG_ANIMATION_SHIT', 24, true);
        BG.animation.play('BG_ANIMATION_SHIT');

    }
    override function create() {
        super.create();
        var POS:Int = 80;
        kris = new FightChar(70, FlxG.height / 2 - (170 + POS*1), 'kris');
        ralsei = new FightChar(120, FlxG.height / 2 - (170 + POS*0), 'ralsei');
        susie = new FightChar(90, FlxG.height / 2 - (170 + POS*2),'susie');
        ralsei.y += 160;
        susie.y += 160;
        kris.y += 160;
        add(BG);
        add(kris);
        add(susie);
        add(ralsei);
    }
}