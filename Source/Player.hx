package;

import flixel.FlxObject;
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
    public var hitbox:FlxSprite = new FlxSprite();
    public var speed:Float = 100;
    var framerate = 5;
    var playable:Bool;
    public function new(?X:Float=0, ?Y:Float=0, char, ?playablevar:Bool=true) {
        
        controls = new Controls("default");

        playable = playablevar;
        super(X,Y);
        hitbox.x = X;
        hitbox.y = Y;
        trace("*god FUCKING damnit KRIS where the FUCK are we?!");
        trace("*we're at " + x + " " + y);
        switch(char){
            case 'kris':
            frames = Paths.fromJson('assets/characters/Kris');
            //trace(frames.length);
            var actualwisth = width;
            scale.y = scale.y / 1.5;
            updateHitbox();
            setGraphicSize(Std.int(actualwisth * 2));
            //setGraphicSize(Std.int(actualwisth * 2));
            animation.addByPrefix('Down', 'Down', 5, true);
            animation.addByPrefix('Up', 'Up', 5, true);
            animation.addByPrefix('Left','Left',5,true);
            animation.addByPrefix('Right','Right',5,true);
        }
        hitbox.setGraphicSize(Std.int(height / 2));
        hitbox.updateHitbox();
        animation.play('Down');
    }
    override public function update(elapsed:Float):Void
        {
            speed = FlxG.keys.pressed.SHIFT ? 200 : 100;
            // Thus movement logic will run every frame
            movement();
            animations();
           
            if (playable) {
                controls.setChecks();
            }

            super.update(elapsed);
            x = hitbox.x; //- width;
            y = hitbox.y - height;
        }

    private function movement() {

        if (controls.up) {
            hitbox.velocity.y = - speed;
        } else if (controls.down) {
            hitbox.velocity.y = speed;
        } else {
            hitbox.velocity.y = 0;
        }

        if (controls.left) {
            hitbox.velocity.x = - speed;
        } else if (controls.right) {
            hitbox.velocity.x = speed;
        } else {
            hitbox.velocity.x = 0;
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

        if (hitbox.velocity.x == 0 && hitbox.velocity.y == 0) {
            animation.stop();
            animation.curAnim.curFrame = 0;
        }
    }
}
