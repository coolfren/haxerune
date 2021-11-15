package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.utils.Assets;
import flixel.FlxG;
import flixel.math.FlxPoint;
class Player extends FlxSprite
{

    private var controls:Controls;

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
        
        controls = new Controls("default");

        playable = playablevar;
        super(X,Y);
        trace("*god FUCKING damnit KRIS where the FUCK are we?!");
        trace("*we're at " + x + " " + y);

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
           
            if (playable) {
                controls.setChecks();
            }

            super.update(elapsed);
        }

    private function movement() {

        if (controls.up) {
            velocity.y = -speed;
        } else if (controls.down) {
            velocity.y = speed;
        } else {
            velocity.y = 0;
        }

        if (controls.left) {
            velocity.x = -speed;
        } else if (controls.right) {
            velocity.x = speed;
        } else {
            velocity.x = 0;
        }
    }

    private function animations() {

        if (controls.up) {
            animation.play('Up');
        } else if (controls.down) {
            animation.play('Down');
        } else if (controls.left) {
            animation.play('Left');
        } else if (controls.right) {
            animation.play('Right');
        }

        if (velocity.x == 0 && velocity.y == 0) {
            animation.stop();
            animation.curAnim.curFrame = 0;
        }
    }
}