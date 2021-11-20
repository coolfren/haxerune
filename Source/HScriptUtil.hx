package;
import flixel.FlxBasic;
import haxe.macro.Expr;
import flixel.FlxSprite;
import flixel.FlxG;
import hscript.*;
import flixel.FlxObject;
class HScriptUtil {
    public var interp:Interp = new Interp();
    public var parser:Parser = new Parser();

    public function new() {
        trace("initialized hscript util");
        initVariables();
        trace("initialized variables");
    }

    public function initVariables() {
        setVar("Math", Math);
        setVar("FlxG", FlxG);
        setVar("FlxSprite", FlxSprite);
        setVar("kris", PlayState.kris);
        setVar("curLevel", PlayState.curLevel);
        setVar("latestSavePoint", PlayState.latestSavePoint);
        setVar("saveName", PlayState.saveName);
        setVar("saveTimeElapsed", PlayState.saveTimeElapsed);
        setVar("Paths", Paths);
        setVar("Std", Std);
        setVar("TextBox", TextBox);
        setVar("TextBox", TextBox);
        setVar("Cutscene", Cutscene);
        setVar("ColorTraces", ColorTraces);
        setVar("Tiles", Tiles);
        setVar("Save", Save);
        setVar("Player", Player);
        setVar("FightChar", FightChar);
        setVar("FightScene", FightScene);
    }

    public function exec(code:String) {
        interp.execute(parser.parseString(code, ".hx"));
    }

    public function setVar(hscriptVariable:String, variable:Dynamic) {
        interp.variables.set(hscriptVariable, variable);
    }
    public inline function get(name:String):Dynamic {
		return interp.variables.get(name);
	}

    // thanks to BULBY for this method!
}