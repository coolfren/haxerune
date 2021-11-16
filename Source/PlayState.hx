package;

import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import openfl.display.Tile;
import openfl.display.BitmapData;
import flixel.FlxState;
import lime.app.Application;
#if cpp
import sys.io.File;
#end
#if !neko
#if desktop 
import Discord.DiscordClient;
import sys.thread.Thread;
#end
#end
import flixel.graphics.frames.FlxFrame;
import openfl.Assets;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxObject;
import flixel.addons.transition.FlxTransitionableState;
class PlayState extends FlxState
{
    var tilesheet:Array<FlxSprite> = [];
    var tiles:FlxTypedSpriteGroup<Tiles>;
    var hittabletiles:FlxTypedSpriteGroup<Tiles>;
    var dataarray:Array<Float> = [];
    var MapData:Array<Array<Array<Dynamic>>>;
    public static var kris:Player;
    var hitboxes:FlxTypedSpriteGroup<FlxSprite>;
    public static var saveName:String;
    public static var curLevel:String;
    public static var saveTimeElapsed:Float;
    public static var latestSavePoint:Int;
    
    public function new(){
        MapData = [
            [['top_left_dark', '', 1],['left_right_top_dark', '', 2],     ['left_right_top_dark','',3], ['left_right_top_dark', '', 4],['top_right_dark', '', 5]],
            [['up_down_left_dark','', 1],    ['left_right_bottom_dark','', 2],['left_right_bottom_dark','', 3], ['middle_walkway_dark', '',4],['up_down_right_dark', '', 5]],
            [['up_down_left_dark','',1],     ['empty','',2, 'hit'],           ['empty','',3, 'hit'], ['empty', '', 4, 'hit'],['up_down_right_dark','',5]],
            [['up_down_left_dark','',1],     ['empty', '',2, 'hit'],          ['empty', '', 3, 'hit'], ['empty', '', 4, 'hit'],['up_down_right_dark', '', 5]],
            [['bottom_left_dark', '', 1],  ['left_right_bottom_dark', '', 2],['left_right_bottom_dark','', 3],['left_right_bottom_dark', '', 4], ['bottom_right_corner_dark', '', 5]]
        ];
        #if desktop
		DiscordClient.initialize();
		
		Application.current.onExit.add (function (exitCode) {
			DiscordClient.shutdown();
		 });
		#end
        tiles = new FlxTypedSpriteGroup(0,0);
        hittabletiles = new FlxTypedSpriteGroup(0,0);
        hitboxes = new FlxTypedSpriteGroup(0,0);
        super();
    }

    override public function create()
    {
        FlxG.worldBounds.set(0,0,FlxG.width,FlxG.height);
        kris = new Player(200,200, 'kris');
        var prevData:Int = -1;
        var yTilePos:Int = 0;
        hitboxes.add(kris.hitbox);
        
        for(i in 0...MapData.length){
            var tempdata:Array<Array<Dynamic>> = MapData[i];
            var inttesty:Int = i;
            for(i in 0...tempdata.length){
                var moretemp:Array<Dynamic> = tempdata[i];
                var temptile = new Tiles(moretemp[0], moretemp[1], 0, 0, moretemp[3]);
                temptile.x -= temptile.width;
                if(i == 0 && inttesty == 0){
                    temptile.x = 0 - temptile.width;
                    temptile.y = 0;
                }
                if(moretemp[2] >= prevData){
                    temptile.x += (moretemp[2] * temptile.width);
                    temptile.y += (yTilePos * temptile.height);
                }else{
                    yTilePos++;
                    temptile.y += (yTilePos * temptile.height);
                    temptile.x += (moretemp[2] * temptile.width);
                }
                prevData = moretemp[2];
                switch(temptile.Type){
                    case "hit":
                        temptile.immovable = true;
                        hittabletiles.add(temptile);   
                        trace('added this bitch to hittable');
                    default:
                        tiles.add(temptile);
                }
            }
        }

        add(tiles);
        add(hittabletiles);
        add(kris);
        add(hitboxes);

        //justneeded this one time, feel free to delete ig
        trace(FlxG.width);
        trace(FlxG.height);
        if(FlxG.sound.music == null)
            FlxG.sound.playMusic(Paths.Music("lancer"),1,true); //testing if placehold mus works or whatev
        #if desktop
        DiscordClient.changePresence('rn codin\' shit in', 'PlayState', null, 0); 
        #end
    }
    override public function update(elapsed:Float){
        super.update(elapsed);
        //FlxG.collide(kris,hittabletiles, processCollisions);
        //debug testing for fighting ig
        #if debug
        if (FlxG.keys.justPressed.SEVEN)
            FlxG.switchState(new debugs.Testcut());
        #end
        FlxG.collide(hitboxes, hittabletiles);
        #if (debug && desktop)
        if (FlxG.keys.justPressed.EIGHT)
            DiscordClient.changePresence('rn codin\' shit in', 'PlayState', null, null, null, true); 
        #end
    }
}