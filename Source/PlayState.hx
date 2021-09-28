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
        //do legit nothing but super lmao
    }
    override public function create()
    {
        //just needed this one time, feel free to delete ig
        trace(FlxG.width);
        trace(FlxG.height);
        //might re add the music later lmao
        FlxG.sound.playMusic('assets/mus/spamton_neo_mix_ex_wip.ogg',1,true);
        kris = new Player(200,200, 'kris');
        add(kris);
    }
    override public function update(elapsed:Float){
        super.update(elapsed);
        //debug testing for fighting ig
        if (FlxG.keys.justPressed.SEVEN)
            FlxG.switchState(new FightScene());

    }
    
}