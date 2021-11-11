package;

import flixel.FlxSprite;
import flixel.FlxG;
import hscript.*;

class HScriptUtil {
    public static var interp:Interp = new Interp();
    public static var parser:Parser = new Parser();

    public static function initVariables() {
        setVar("Math", Math);
        setVar("FlxG", FlxG);
        setVar("FlxSprite", FlxSprite);
        setVar("kris", PlayState.kris);
        setVar("curLevel", PlayState.curLevel);
        setVar("latestSavePoint", PlayState.latestSavePoint);
        setVar("saveName", PlayState.saveName);
        setVar("saveTimeElapsed", PlayState.saveTimeElapsed);
    }

    public static function exec(code:String) {
        interp.execute(parser.parseString(code));
    }
    
    public static function setVar(hscriptVariable:String, variable:Dynamic) {
        interp.variables.set(hscriptVariable, variable);
    }
}