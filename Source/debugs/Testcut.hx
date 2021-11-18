package debugs;

import flixel.util.FlxTimer;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxState;
import flixel.FlxSprite;
import openfl.Assets;


class Testcut extends FlxState{
    var cutscene:HScriptUtil = new HScriptUtil();
    var sprites:FlxTypedSpriteGroup<FlxSprite>;
    public function new(){
        super();
        add(cutscene);
        sprites = new FlxTypedSpriteGroup(0,0);
        add(sprites);
        cutscene.initVariables(); 
        cutscene.setVar("sprites", sprites);
        cutscene.setVar("timer", FlxTimer);
        cutscene.setVar("fadein", fadein);
        trace(Assets.getText("assets/hscript/debug.hscript"));
        cutscene.exec(Assets.getText("assets/hscript/debug.hscript"));
    }
    public static function fadein(sprite:FlxSprite){
        for(i in 0...100){
            sprite.alpha = i / 100;
        }
    }
}