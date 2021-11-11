package;

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
    var saver:FlxSave = new FlxSave();

    var levelSavePoint:Int;
    var saveX:Float;
    var saveY:Float;

    var index:Int;

    var saveButtons:FlxTypedGroup<FlxSprite>;

    public function save() {
        saveButtons = new FlxTypedGroup<FlxSprite>();
    }

    function saveData() {
        saver.bind("SAVE " + index);
        var savingData:SaveFile = {
            savePoint: levelSavePoint,
            saveLocation: new FlxPoint(saveX, saveY),
            saveFile: index,
            name: "TestSave",
            time: 0,
            level: "TestLevel"
        }

        saver.data.level = savingData;
    }
}