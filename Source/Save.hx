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
    static var saver:FlxSave = new FlxSave();

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

        trace('SAVIN DATA:\nthe save "file" ${savingData}\nthe save data $savingData');

        saver.data.level = savingData;
    }

    public static function loadData(char:FlxSprite) {
        char.setPosition(savingData.saveLocation.x, savingData.saveLocation.y);
        PlayState.curLevel = savingData.level;
        PlayState.saveName = savingData.name;
        PlayState.saveTimeElapsed = savingData.time;
    }
}

class SaveObject extends FlxSprite {

    var state:FlxState;

    public function new(x:Float = 0, y:Float = 0, _state:FlxState) {
        super(x, y);
        makeGraphic(50, 50);
        state = _state;
        immovable = true;
    }

    public override function update(elapsed:Float) {
        super.update(elapsed);
        onCollide();
    }

    public function onCollide() {
        if (FlxG.collide(this, PlayState.kris)) {
            initSave();
        }
    }

    public function initSave() {
        state.openSubState(new SaveSubState());
        trace('imagine if the save substate state exists');
    }
}

class SaveSubState extends FlxSubState {
    
    var saveBtns:FlxTypedGroup<FlxSpriteGroup>;
    
    public function new() {
        saveBtns = new FlxTypedGroup<FlxSpriteGroup>();
        add(saveBtns);
        super();
    }

    public override function create() {
        super.create();
    }

    public override function update(elapsed:Float) {
        super.update(elapsed);
    }

    function createButtons() {
        
    }
}