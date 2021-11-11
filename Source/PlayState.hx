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
    var tiles:FlxTypedGroup<Tiles>;
    var hittabletiles:FlxTypedGroup<Tiles>;
    var dataarray:Array<Float> = [];
    var MapData:Array<Array<Array<Dynamic>>>;
    public static var kris:Player;

    public static var saveName:String;
    public static var curLevel:String;
    public static var saveTimeElapsed:Float;
    public static var latestSavePoint:Int;
    
    public function new(){
        MapData = [
            [['top_left_dark', '', 1],['left_right_top_dark', '', 2],     ['left_right_top_dark','',3], ['left_right_top_dark', '', 4],['top_right_dark', '', 5]],
            [['up_down_left_dark','', 1],    ['left_right_bottom_dark','', 2],['left_right_bottom_dark','', 3], ['middle_walkway_dark', '',4],['up_down_right_dark', '', 5]],
            [['up_down_left_dark','',1],     ['empty','',2],           ['empty','',3], ['empty', '', 4],['up_down_right_dark','',5]],
            [['up_down_left_dark','',1],     ['empty', '',2],          ['empty', '', 3], ['empty', '', 4],['up_down_right_dark', '', 5]],
            [['bottom_left_dark', '', 1],  ['left_right_bottom_dark', '', 2],['left_right_bottom_dark','', 3],['left_right_bottom_dark', '', 4], ['bottom_right_corner_dark', '', 5]]
        ];
        #if desktop
		DiscordClient.initialize();
		
		Application.current.onExit.add (function (exitCode) {
			DiscordClient.shutdown();
		 });
		#end
        tiles = new FlxTypedGroup();
        hittabletiles = new FlxTypedGroup();
        super();
    }

    override public function create()
    {
        FlxG.worldBounds.set(0,0,FlxG.width,FlxG.height);
        kris = new Player(200,200, 'kris');
        var prevData:Int = -1;
        var yTilePos:Int = 0;
        
        for(i in 0...MapData.length){
            var tempdata:Array<Array<Dynamic>> = MapData[i];
            var inttesty:Int = i;
            for(i in 0...tempdata.length){
                    var moretemp:Array<Dynamic> = tempdata[i];
                    var temptile = new Tiles(moretemp[0], moretemp[1], 0, 0);
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
                    if(temptile.ISHITABBLE){
                        temptile.immovable = true;
                        hittabletiles.add(temptile);   
                        trace('added this bitch to hittable');
                    }else{
                        tiles.add(temptile);
                    }
            }
        }

        add(tiles);
        add(hittabletiles);
        add(kris);

        //justneeded this one time, feel free to delete ig
        trace(FlxG.width);
        trace(FlxG.height);
        //might re add the music later lmao //ahah funni queen momento
        if(FlxG.sound.music == null)
            FlxG.sound.playMusic('assets/mus/queen_boss.ogg',1,true);
        #if desktop
        DiscordClient.changePresence('rn codin\' shit in', 'PlayState', null, 0); 
        #end
    }
    override public function update(elapsed:Float){
        super.update(elapsed);
        //FlxG.collide(kris,hittabletiles, processCollisions);
        //debug testing for fighting ig
        if (FlxG.keys.justPressed.SEVEN)
            FlxG.switchState(new FightScene());
        #if desktop
        #if debug

        FlxG.collide(kris, hittabletiles);

        if (FlxG.keys.justPressed.EIGHT)
            DiscordClient.changePresence('rn codin\' shit in', 'PlayState', null, null, null, true); 
        #end
        #end
    }
}