package;

import flixel.FlxState;
import sys.io.File;
import aseprite.Aseprite;
import openfl.Assets;
import flixel.FlxG;
import flixel.addons.transition.FlxTransitionableState;
class PlayState extends FlxState
{
    var kris:Player;
    function new()
    {
        super();
    }
    override public function create()
    {
        trace(FlxG.width);
        trace(FlxG.height);
        //FlxG.sound.playMusic('assets/mus/spamton_neo_mix_ex_wip.ogg',1,true);
        kris = new Player(200,200, 'kris');
        add(kris);
    }
    override public function update(elapsed:Float){
        super.update(elapsed);
        if (FlxG.keys.justPressed.SEVEN)
            FlxG.switchState(new FightScene());

    }
    
}