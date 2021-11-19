package;
import haxe.macro.Expr;
import flixel.FlxSprite;
import flixel.FlxG;
import hscript.*;
import flixel.FlxObject;
class HScriptUtil extends FlxObject {
    public var interp:Interp = new Interp();
    public var parser:Parser = new Parser();

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
    }

    public function exec(code:String, func:String = 'main') {
        trace( interp.execute(parser.parseString(code, ".hx")) );
    }

    public function setVar(hscriptVariable:String, variable:Dynamic) {
        interp.variables.set(hscriptVariable, variable);
    }
    public inline function get(name:String):Dynamic {
		return interp.variables.get(name);
	}
}