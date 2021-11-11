package;

import flixel.FlxState;
import flixel.FlxG;
class Cutscene extends FlxState
{
    var xToo:Float = 0;
    var yToo:Float = 0;
    var xx:Float = 0;
    var yy:Float = 0;

    var kris:Player;
   public function new()
        {
            super();
            kris = new Player(FlxG.width / 2, FlxG.height / 2, "kris", false);
            add(kris);
            moveto(100,100 + 100, kris);
        
        }
    override public function create() {
            super.create();
        }

    public function moveto(xto:Float, yto:Float, char){
        xx = char.x;
        yy = char.y;


        xToo = xto;
        yToo = yto;
    }

    override public function update(elapsed:Float) {
        super.update(elapsed);

        if(xToo < (xx + 5) || xToo < (xx - 5) && !kris._left){
            kris._left = true;
        }
        else if(xToo > (kris.x + 5) || xToo > (kris.x - 5)){
            kris._left = false;
            xx = kris.x;
        }

        if(xToo > (xx + 5) || xToo > (xx - 5) && !kris._right){
            kris._right = true;
        }
        else if(xToo < (kris.x + 5) || xToo < (kris.x - 5)){
            kris._right = false;
            xx = kris.x;
        }

        if(yToo > (yy + 5) || yToo > (yy - 5) && !kris._down){
            kris._down = true;
        }
        else if(yToo < (kris.y + 5) || yToo < (kris.y - 5)){
            kris._down = false;
            yy = kris.y;
        }

        if(yToo < (yy + 5) || yToo < (yy - 5) && !kris._up){
            kris._up = true;
        }
        else if(yToo > (kris.y + 5) || yToo > (kris.x - 5)){
            kris._up = false;
            yy = kris.y;
        }
        trace(kris.x);
        trace('xx = $xx');
        if (FlxG.keys.justPressed.SEVEN)
            FlxG.switchState(new PlayState());
    }
}