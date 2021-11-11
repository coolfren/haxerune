package;

import flixel.group.FlxSpriteGroup;
import flixel.FlxSubState;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxSave;
import flixel.math.FlxPoint;

typedef SaveFile = {
    var savePoint:Int;
    var saveLocation:FlxPoint;
    var saveFile:Int;
    var name:String;
    var time:Float;
    var level:String;
}

class Save {
    public static var saver:FlxSave = new FlxSave();

    static var levelSavePoint:Int;
    static var saveX:Float;
    static var saveY:Float;

    static var index:Int;

    public static var savingData:SaveFile;

    public static function saveData(char:FlxSprite) {
        saver.bind("SAVE " + index);
        savingData = {
            savePoint: PlayState.latestSavePoint,
            saveLocation: new FlxPoint(char.x, char.y),
            saveFile: index,
            name: PlayState.saveName,
            time: PlayState.saveTimeElapsed,
            level: PlayState.curLevel,
        }
    }
}