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
        cutscene.setVar("FlxTimer", FlxTimer);
        cutscene.setVar("Controls", Controls);
        cutscene.setVar("images", sprites.members);
        //cutscene.setVar("FlxTween", FlxTween)
        trace("\n" + Assets.getText("assets/hscript/debug.hx"));
        cutscene.exec(Assets.getText("assets/hscript/debug.hx"));
        var main = cutscene.get("main"); 
        if(main != null){
            main();
        }
    
    }
    override public function update(elapsed:Float){
        super.update(elapsed);
        var updateuwu = cutscene.get("update");
        if(updateuwu != null){
            updateuwu();
        }
    }
}