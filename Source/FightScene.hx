package;

import flixel.util.FlxColor;
import flixel.FlxSubState;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxGame;
import openfl.Assets;
#if !neko
#if desktop
import Discord.DiscordClient;
import sys.thread.Thread;
#end
#end

class FightScene extends FlxSubState
{
    var BG:FlxSprite;
    var kris:FightChar;
    var susie:FightChar;
    var ralsei:FightChar;
    public function new(){
        //just for fighting ig
        super();
        add(new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK));
        BG = new FlxSprite(-50,-50);
        BG.frames = FlxAtlasFrames.fromSparrow('assets/Animations/Bg_BATTLE_Animates.png', Assets.getText('assets/Animations/Bg_BATTLE_Animates.xml'));
        BG.animation.addByPrefix('BG_ANIMATION_SHIT','BG_ANIMATION_SHIT', 24, true);
        BG.animation.play('BG_ANIMATION_SHIT');
        if(FlxG.sound.music != null){
            FlxG.sound.music.stop();
            FlxG.sound.playMusic(Paths.Music("battle"));
        }
    }
    override function create() {
        super.create();
        var POS:Int = 80;
        kris = new FightChar(70, FlxG.height / 2 - (170 + POS*1), 'kris');
        ralsei = new FightChar(120, FlxG.height / 2 - (170 + POS*0), 'ralsei');
        susie = new FightChar(90, FlxG.height / 2 - (170 + POS*2),'susie');
        ralsei.y += 160;
        susie.y += 160;
        kris.y += 160;
        add(BG);
        add(kris);
        add(susie);
        add(ralsei);
        #if (desktop && cpp)
        DiscordClient.changePresence('Jus Fighting (maybe if this is implemented yet uwu)', 'Fighting'); 
        #end
    }
    override public function update(elapsed:Float){
        super.update(elapsed);
        //debug testing for fighting ig
        if (FlxG.keys.justPressed.SEVEN)
            FlxG.switchState(new Cutscene());

    }
}
