package;

import flixel.FlxBasic;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import webm.WebmIoFile;
import webm.WebmPlayer;
import webm.WebmEvent;

class FlxVideo extends FlxBasic
{
	public function new(intendedState:FlxState, webmPath:String) {
		// must be vp8 webm

        super();

		var webmPath = Paths.getVideo(webmPath);

		// set up the player
		var io:WebmIoFile = new WebmIoFile(webmPath);
		var player:WebmPlayer = new WebmPlayer();
        player.fuck(io, true);

		// listen to some events (optional)
		player.addEventListener(WebmEvent.PLAY, function(e)
		{
			trace('play!');
            if (FlxG.sound.music.playing)
                FlxG.sound.music.pause();
		});

		player.addEventListener(WebmEvent.STOP, function(e)
            {
                trace('stop!');
                FlxG.sound.music.play();
            });

		player.addEventListener(WebmEvent.COMPLETE, function(e)
		{
			trace('end!');
		});

        player.addEventListener(WebmEvent.RESTART, function(e) {
            trace('restarted!');
        });

		// WebmPlayer extends Bitmap
		// so FlxSprite can be created from the underlying BitmapData
		var sprite = new FlxSprite(player.bitmapData);
		intendedState.add(sprite);

		// play the video
		player.play();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}