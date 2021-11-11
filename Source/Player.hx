package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.utils.Assets;
import flixel.FlxG;
import flixel.math.FlxPoint;
class Player extends FlxSprite
{
    private var dx:Int = 0;
    private var dy:Int = 0;
    public var _up:Bool = false;
    public var _down:Bool = false;
    public var _left:Bool = false;
    public var _right:Bool = false;
    var _run:Bool = false;
    public var speed:Float = 100;
    var framerate = 5;
    var playable:Bool;
    public function new(?X:Float=0, ?Y:Float=0, char, ?playablevar:Bool=true) {
        //this.x = x;
        //this.y = y;
        playable = playablevar;
        super(X,Y);
        trace("*god FUCKING damnit KRIS where the FUCK are we?!");
        trace("*we're at " + x + " " + y);
        // drag.x = drag.y = 1600;
        //basicly the same to character.hx in fnf lmao just bit dif
        switch(char){
            case 'kris':
            frames = Paths.fromJson('assets/characters/Kris');
            //trace(frames.length);
            setGraphicSize(Std.int(width * 2));
            animation.addByPrefix('Down', 'Down', 5, true);
            animation.addByPrefix('Up', 'Up', 5, true);
            animation.addByPrefix('Left','Left',5,true);
            animation.addByPrefix('Right','Right',5,true);
        }
        animation.play('Down');
    }
    override public function update(elapsed:Float):Void
        {
            _run = FlxG.keys.anyPressed([SHIFT]);
            if(_run)
                speed = 200;
            else
                speed = 100;
            // Thus movement logic will run every frame
            movement();
            animations();
           
            super.update(elapsed);
        }

    private function movement() {
        if (playable) {
            _up = FlxG.keys.anyPressed([UP, W]);
            _down = FlxG.keys.anyPressed([DOWN, S]);
            _left = FlxG.keys.anyPressed([LEFT, A]);
            _right = FlxG.keys.anyPressed([RIGHT, D]);
        }

        if (_up) {
            velocity.y = -speed;
        } else if (_down) {
            velocity.y = speed;
        } else {
            velocity.y = 0;
        }

        if (_left) {
            velocity.x = -speed;
        } else if (_right) {
            velocity.x = speed;
        } else {
            velocity.x = 0;
        }
    }

    private function animations() {
        if (playable) {
            _up = FlxG.keys.anyPressed([UP, W]);
            _down = FlxG.keys.anyPressed([DOWN, S]);
            _left = FlxG.keys.anyPressed([LEFT, A]);
            _right = FlxG.keys.anyPressed([RIGHT, D]);
        }

        if (_up) {
            animation.play('Up');
        } else if (_down) {
            animation.play('Down');
        } else if (_left) {
            animation.play('Left');
        } else if (_right) {
            animation.play('Right');
        }

        if (velocity.x == 0 && velocity.y == 0) {
            animation.stop();
            animation.curAnim.curFrame = 0;
        }
    }
}