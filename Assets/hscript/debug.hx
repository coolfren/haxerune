var testnumb = 0;
var tweentimer = 5;
var thing = new FlxSprite(0,0);
var state = 'movingimage';
//this some lua modchart type shit lmao
function main(){
    //var textbox = new FlxSprite.
    thing.loadGraphic(Paths.getImage("spr_introimage0_0.png"));
    var textbox = new FlxSprite().makeGraphic(FlxG.width, FlxG.height / 3,0xFF000000);
    textbox.y = FlxG.height - textbox.height;
    thing.setGraphicSize(Std.int(thing.width * 2));
    thing.x = (FlxG.width / 2) - (thing.width / 2);
    game.add(thing);
    game.add(textbox);
    thing.y = (-testnumb / 2.3) + (thing.height / 2);
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
        switch(state){
            case 'movingimage':
                thing.y = (-testnumb / 2) + (thing.height / 2);
                tweentimer = testnumb + 5;
                if(testnumb > 950){
                    state = "tweenout";
                    testnumb = 0;
                    tweentimer = 5;
                }
            case 'tweenout':
                if(testnumb > 300){
                    if(!FlxG.sound.music.playing){
                        FlxG.sound.music.play();
                    }
                    thing.alpha = -(((testnumb - 300) / 1.5) / 50) + 1; //rewritin dis one sec
                    tweentimer = testnumb + 5;
                    if(thing.alpha == 0){
                        game.remove(thing);

                    }
                }else if(FlxG.sound.music.playing && testnumb > 100){
                    FlxG.sound.music.pause();
                }

        }
    }
    trace(testnumb);
    trace(doit);
    //basicly this makes the effect that the normal cutscene goes through
    testnumb = testnumb +1;
}