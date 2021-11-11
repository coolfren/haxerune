package;

import flixel.input.keyboard.FlxKey;
import flixel.input.actions.FlxActionSet;
import flixel.input.actions.FlxAction;

using StringTools;

enum abstract Actions(String) to String from String {
    var UP_P = 'upP';
    var DOWN_P = 'downP';
    var LEFT_P = 'leftP';
    var RIGHT_P = 'rightP';
    var UP = "up";
    var DOWN = "down";
    var LEFT = "left";
    var RIGHT = "right";
    var UP_R = "upR";
    var DOWN_R = "downR";
    var LEFT_R = "leftR";
    var RIGHT_R = "rightR";
    var UI_UP_P = 'upP';
    var UI_DOWN_P = 'downP';
    var UI_LEFT_P = 'leftP';
    var UI_RIGHT_P = 'rightP';
    var UI_UP = "UI-up";
    var UI_DOWN = "UI-down";
    var UI_LEFT = "UI-left";
    var UI_RIGHT = "UI-right";
    var UI_UP_R = "UI-upR";
    var UI_DOWN_R = "UI-downR";
    var UI_LEFT_R = "UI-leftR";
    var UI_RIGHT_R = "UI-rightR";
    var ACCEPT = "accept";
    var PAUSE = "pause";
    var BACK = "back";
}

class Controls extends FlxActionSet {

    var _up = new FlxActionDigital(Actions.UP);
    var _down = new FlxActionDigital(Actions.DOWN);
    var _left = new FlxActionDigital(Actions.LEFT);
    var _right = new FlxActionDigital(Actions.RIGHT);
    var _upP = new FlxActionDigital(Actions.UP_P);
    var _downP = new FlxActionDigital(Actions.DOWN_P);
    var _leftP = new FlxActionDigital(Actions.LEFT_P);
    var _rightP = new FlxActionDigital(Actions.RIGHT_P);
    var _upR = new FlxActionDigital(Actions.UP_R);
    var _downR = new FlxActionDigital(Actions.DOWN_R);
    var _leftR = new FlxActionDigital(Actions.LEFT_R);
    var _rightR = new FlxActionDigital(Actions.RIGHT_R);

    // * ui actions

    var _ui_up = new FlxActionDigital(Actions.UI_UP);
    var _ui_down = new FlxActionDigital(Actions.UI_DOWN);
    var _ui_left = new FlxActionDigital(Actions.UI_LEFT);
    var _ui_right = new FlxActionDigital(Actions.UI_RIGHT);
    var _ui_upP = new FlxActionDigital(Actions.UI_UP_P);
    var _ui_downP = new FlxActionDigital(Actions.UI_DOWN_P);
    var _ui_leftP = new FlxActionDigital(Actions.UI_LEFT_P);
    var _ui_rightP = new FlxActionDigital(Actions.UI_RIGHT_P);
    var _ui_upR = new FlxActionDigital(Actions.UI_UP_R);
    var _ui_downR = new FlxActionDigital(Actions.UI_DOWN_R);
    var _ui_leftR = new FlxActionDigital(Actions.UI_LEFT_R);
    var _ui_rightR = new FlxActionDigital(Actions.UI_RIGHT_R);
    var _pause = new FlxActionDigital(Actions.PAUSE);

    // * universal actions

    var _accept = new FlxActionDigital(Actions.ACCEPT);
    var _back = new FlxActionDigital(Actions.BACK);

    // * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ * \\

    public var up:Bool;
    public var down:Bool;
    public var left:Bool;
    public var right:Bool;
    public var upP:Bool;
    public var downP:Bool;
    public var leftP:Bool;
    public var rightP:Bool;
    public var upR:Bool;
    public var downR:Bool;
    public var leftR:Bool;
    public var rightR:Bool;

    // * ui action bools

    public var ui_up:Bool;
    public var ui_down:Bool;
    public var ui_left:Bool;
    public var ui_right:Bool;
    public var ui_upP:Bool;
    public var ui_downP:Bool;
    public var ui_leftP:Bool;
    public var ui_rightP:Bool;
    public var ui_upR:Bool;
    public var ui_downR:Bool;
    public var ui_leftR:Bool;
    public var ui_rightR:Bool;
    public var pause:Bool;

    // * universal action bools

    public var accept:Bool;
    public var back:Bool;

    var actionMap:Map<String, FlxActionDigital> = [];

    public function new(?name:String = 'default') {
        super(name);
        setBinds();
    }

    function ch(action:FlxActionDigital) {
        return action.check();
    }

    public function setChecks() {
        up = ch(_up);
        down = ch(_down);
        left = ch(_left);
        right = ch(_right);
        upP = ch(_upP);
        downP = ch(_downP);
        leftP = ch(_leftP);
        rightP = ch(_rightP);
        upR = ch(_upP);
        downR = ch(_downP);
        leftR = ch(_leftP);
        rightR = ch(_rightP);
    
        ui_up = ch(_ui_up);
        ui_down = ch(_ui_down);
        ui_left = ch(_ui_left);
        ui_right = ch(_ui_right);
        ui_upP = ch(_ui_upP);
        ui_downP = ch(_ui_downP);
        ui_leftP = ch(_ui_leftP);
        ui_rightP = ch(_ui_rightP);
        ui_upR = ch(_ui_upR);   
        ui_downR = ch(_ui_downR);
        ui_leftR = ch(_ui_leftR);
        ui_rightR = ch(_ui_rightR);
        pause = ch(_pause);

        accept = ch(_accept);
        back = ch(_back); 
    }

    function setBinds() {
        bindKeys(_up, [UP, W]);
        bindKeys(_down, [DOWN, S]);
        bindKeys(_left, [LEFT, A]);
        bindKeys(_right, [RIGHT, D]);
        bindKeys(_upP, [UP, W]);
        bindKeys(_downP, [DOWN, S]);
        bindKeys(_leftP, [LEFT, A]);
        bindKeys(_rightP, [RIGHT, D]);
        bindKeys(_upR, [UP, W]);
        bindKeys(_downR, [DOWN, S]);
        bindKeys(_leftR, [LEFT, D]);
        bindKeys(_rightR, [RIGHT, A]);    
        bindKeys(_ui_up, [UP, W]);
        bindKeys(_ui_down, [DOWN, S]);
        bindKeys(_ui_left, [LEFT, D]);
        bindKeys(_ui_right, [RIGHT, A]);
        bindKeys(_ui_upP, [UP, W]);
        bindKeys(_ui_downP, [DOWN, S]);
        bindKeys(_ui_leftP, [LEFT, D]);
        bindKeys(_ui_rightP, [RIGHT, A]);
        bindKeys(_ui_upR, [UP, W]);
        bindKeys(_ui_downR, [DOWN, S]);
        bindKeys(_ui_leftR, [LEFT, D]);
        bindKeys(_ui_rightR, [RIGHT, A]);
    }

    function bindKeys(action:FlxActionDigital, arrayOfKeys:Array<FlxKey>) {
        for (i in arrayOfKeys) {
            if (action.name.endsWith('P')) {
                action.addKey(i, JUST_PRESSED);
            } else if (action.name.endsWith('R')) {
                action.addKey(i, RELEASED);
            } else {
                action.addKey(i, PRESSED);
            }
        }
    } 
}