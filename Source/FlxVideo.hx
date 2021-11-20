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
		player.addEventListener('play', function(e)
		{
			trace('play!');
		});
		player.addEventListener('end', function(e)
		{
			trace('end!');
		});
		player.addEventListener('stop', function(e)
		{
			trace('stop!');
            FlxG.sound.music.play();
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