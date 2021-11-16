package debugs;

import flixel.util.FlxTimer;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxState;
import flixel.FlxSprite;
import openfl.Assets;


class Testcut extends FlxState{
    var sprites:FlxTypedSpriteGroup<FlxSprite>;
    public function new(){
        super();
        sprites = new FlxTypedSpriteGroup(0,0);
        add(sprites);
        HScriptUtil.initVariables(); 
        HScriptUtil.setVar("sprites", sprites);
        HScriptUtil.setVar("timer", FlxTimer);
        HScriptUtil.setVar("fadein", fadein);
        trace(Assets.getText("assets/hscript/debug.hscript"));
        HScriptUtil.exec(Assets.getText("assets/hscript/debug.hscript"));
    }
    public static function fadein(sprite:FlxSprite){
        for(i in 0...100){
            sprite.alpha = i / 100;
        }
    }
}