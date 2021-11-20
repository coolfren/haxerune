package;

import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;

using StringTools;

enum abstract DEvent(String) from String to String {
    var None = "NONE";
}

typedef DialogueData = {
    var character:String;
    var text:String;
    var typingSpeed:Float;
    var event:DEvent;
}

class TextBox extends FlxSpriteGroup {
    var box:FlxSprite;
    var text:FlxTypeText = new FlxTypeText(0,0,0, "",10);

    var curChar:String = '';

    var isInDialogue:Bool = true;

    var dialogueData:Array<DialogueData> = [];

    public function new(x:Float = 0, y:Float = 0){
        super(x, y);
        init(true);
    }

    public function init(?lazyDebugger:Bool = false) {
        if (!lazyDebugger) {
            // blah blah animations here
        } else {
            makeGraphic(200, 130);
            updateHitbox();
        }
    }

    public function loadDialogue(data:Array<String>) {
        for (i in data) {

            var splitShit:Array<String> = i.split(':');

            var dialogue:DialogueData = {
                character: splitShit[0],
                text: splitShit[1],
                typingSpeed: Std.parseFloat(splitShit[2]),
                event: splitShit[3]
            }

            dialogueData.push(dialogue);
        }

        #if debug
        trace(dialogueData);
        #end
    }

    var index:Int = 0;

    var isEnding:Bool = false;

    public function runDialogue() {
        text.resetText(dialogueData[index].text);
        curChar = dialogueData[index].character;
        text.start(dialogueData[index].typingSpeed);
        runEvent(dialogueData[index].event);
    }

    public function endDialogue() {
        isEnding = true;
        isInDialogue = false;
    }

    public function playDialogue(ctrls:Controls) {
        if (ctrls.accept && index < dialogueData.length) {
            index++;
            runDialogue();
            isEnding = false;
        } else if (index == dialogueData.length || dialogueData[index] == null) {
            endDialogue();
        }
    }

    function runEvent(ev:DEvent) {

    }

    function fixHitboxes(offsetWidth:Float = 0, ?offsetHeight:Float = 0) {
        if (!text.autoSize) {
            text.fieldWidth = box.width - offsetWidth;
            updateHitbox();
            dirty = true;
        }
    }
}