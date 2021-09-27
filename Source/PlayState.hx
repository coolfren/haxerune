package;

import flixel.FlxState;
import sys.io.File;
import aseprite.Aseprite;
import openfl.Assets;
import flixel.FlxG;
class PlayState extends FlxState
{
    var kris:Player;
    function new()
    {
        super();
    }
    override public function create()
    {
        FlxG.sound.playMusic('assets/mus/cyber.ogg',1,true);
        kris = new Player();
        add(kris);
    }
    override public function update(elapsed:Float){
        super.update(elapsed);
    }

}