package debugs;

import flixel.util.FlxTimer;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxState;
import flixel.FlxSprite;
import openfl.Assets;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.system.FlxSound;
//import openal.*;
//import openfl.media.Video;


class Testcut extends FlxState{
    var cutscene:HScriptUtil = new HScriptUtil();
    var sprites:FlxTypedSpriteGroup<FlxSprite>;
    //var video = new Video(FlxG.width, FlxG.height);
    public function new(){
        super();
        sprites = new FlxTypedSpriteGroup(0,0);
        add(sprites);
        cutscene.initVariables(); 
        //var uwu = new FlxSprite();
        //uwu.makeGraphic(FlxG.width,Std.int(FlxG.height / 5),FlxColor.BLACK);
        cutscene.setVar("FlxTimer", FlxTimer);
        cutscene.setVar("Controls", Controls);
        cutscene.setVar("setpitch", repitchmus);
        cutscene.setVar("game", this);

        //cutscene.setVar("FlxTween", FlxTween)s //ah yes, S
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

    function repitchmus(percentage:Int = 1){
        @:privateAccess
            lime.media.openal.AL.sourcef(FlxG.sound.music._channel.__source.__backend.handle, lime.media.openal.AL.PITCH, percentage);
    }//dont
    //it commits null object reference
}