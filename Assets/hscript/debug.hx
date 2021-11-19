var testnumb = 0;
var tweentimer = 5;
var thing = new FlxSprite(0,0);
var donetweenthing = false;
//this some lua modchart type shit lmao
function main(){
    //var textbox = new FlxSprite.
    thing.loadGraphic(Paths.getImage("spr_introimage0_0.png"));
    var textbox = new FlxSprite().makeGraphic(FlxG.width, FlxG.height / 3,0xFF000000);
    textbox.y = FlxG.height - textbox.height;
    thing.setGraphicSize(Std.int(thing.width * 2));
    thing.x = (FlxG.width / 2) - (thing.width / 2);
    sprites.add(thing);
    sprites.add(textbox);
    sprites.members[0].y = (-testnumb / 2.3) + (sprites.members[0].height / 2);
    //thing.alpha = 0.2;
    FlxG.sound.music.stop();
    //setpitch(0.75);
    FlxG.sound.playMusic(Paths.Music("legend-repitched"),1,true);
    //FlxG.sound.music.
}

function update(){
    var doit = (testnumb > tweentimer);
    trace(doit);
    
    if(doit){
        if(testnumb < 1077)
            sprites.members[0].y = (-testnumb / 2.15) + (sprites.members[0].height / 2);
        tweentimer = testnumb + 5;
    }
    trace(testnumb);
    trace(doit);
    //basicly this makes the effect that the normal cutscene goes through
    testnumb += 1;
}