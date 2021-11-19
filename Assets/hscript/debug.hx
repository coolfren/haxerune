var testnumb = 0;
var thing = new FlxSprite(0,0);
var donetweenthing = false;
//this some lua modchart type shit lmao
function main(){
    thing.loadGraphic(Paths.getImage("spr_introimage0_0.png"));
    thing.x = (FlxG.width / 2) - (thing.width / 2);
    sprites.add(thing);
    //thing.alpha = 0.2;
    FlxG.sound.music.stop();
    FlxG.sound.playMusic(Paths.Music("legend"),1,true);
}

function update(){
    trace(testnumb + " is the update frame we are on (hscript trace thing uwu)");
    //LETS FUCKING GOOOOOOOOOOOOOOOOOOOOOOOO IT WORKS NOW
    switch(testnumb * 2){ //dumb shit
        case 0: 
            sprites.members[0].alpha = 0.0;
        case 100:
            sprites.members[0].alpha = 0.2;
        case 200:
            sprites.members[0].alpha = 0.4;
        case 300:
            sprites.members[0].alpha = 0.6;
        case 400: 
            sprites.members[0].alpha = 0.8;
        case 500:
            sprites.members[0].alpha = 1;
        //basicly this makes the effect that the normal cutscene goes through
    }
    
    testnumb += 1;
}