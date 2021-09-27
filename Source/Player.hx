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
    var _up:Bool = false;
    var _down:Bool = false;
    var _left:Bool = false;
    var _right:Bool = false;
    var _run:Bool = false;
    public var speed:Float = 100;
    var framerate = 5;
    public function new(?X:Float=0, ?Y:Float=0) {
        super(x,y);
        drag.x = drag.y = 1600;
        frames = FlxAtlasFrames.fromTexturePackerJson('assets/characters/Kris.png', Assets.getText('assets/characters/Kris.json'));
        //trace(frames.length);
        setGraphicSize(Std.int(width * 3));
        animation.addByPrefix('Down', 'Down', 5, true);
        animation.addByPrefix('Up', 'Up', 5, true);
        animation.addByPrefix('Left','Left',5,true);
        animation.addByPrefix('Right','Right',5,true);
        //animation.play('Down');
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
           
            super.update(elapsed);
        }
        function movement():Void
            {
                
        
                // When desired key is pressed
                _up = FlxG.keys.anyPressed([UP, W]);
                _down = FlxG.keys.anyPressed([DOWN, S]);
                _left = FlxG.keys.anyPressed([LEFT, A]);
                _right = FlxG.keys.anyPressed([RIGHT, D]);
                if(!_up && !_down && !_right && !_left){
                    if(animation.curAnim != null){
                        animation.curAnim.stop();
                        animation.curAnim.curFrame = 0;
                    }
                    trace('chu are stopped');
                }
                //Cancel out opposite directions
                if (_up && _down)
                    _up = _down = false;
                if (_left && _right)
                    _left = _right = false;
                
                // If actually moving, set angle
                if (_up || _down || _left || _right){
                    
                    // Initialize angle
                    var mA:Float = 0;            
                    if (_up)
                    {
                        
                        animation.play('Up', false);
                        //animation.curAnim.resume();
                        animation.curAnim.frameRate = 5;
                        mA = -90;
                        if (_left)
                            mA -= 45;
                        else if (_right)
                            mA += 45;
                    }
                    else if (_down)
                    {
                        
                        animation.play('Down');
                        //animation.curAnim.resume();
                        animation.curAnim.frameRate = 5;
                        mA = 90;
                        if (_left)
                            mA += 45;
                        else if (_right)
                            mA -= 45;
                    }
                    else if (_left){
                        animation.play('Left');
                        //animation.curAnim.resume();
                        animation.curAnim.frameRate = 5;
                        mA = 180;
                    }else if (_right){
                        animation.play('Right');
                        //animation.curAnim.resume();
                        animation.curAnim.frameRate = 5;
                        mA = 0;
                    }
                    
                    //Add magnitude to the velocity vector in mA angle direction
                    velocity.set(speed, 0);
                    velocity.rotate(FlxPoint.weak(0, 0), mA);
                }
            }
}