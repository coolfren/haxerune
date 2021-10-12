package;
import haxe.PosInfos;

class ColorTraces
{
	inline public static var RED="\033[0;31m";
	inline public static var GREEN="\033[0;32m";
	inline public static var YELLOW="\033[0;33m";
	inline public static var BLUE="\033[0;34m";
	inline public static var MAGENTA="\033[0;35m";
	inline public static var CYAN="\033[0;36m";
	inline public static var NC="\033[0m";//No Color

	inline public static function red(s :String) :String
	{
		return '${RED}${s}${NC}';
	}

	inline public static function green(s :String) :String
	{
		return '${GREEN}${s}${NC}';
	}

	inline public static function yellow(s :String) :String
	{
		return '${YELLOW}${s}${NC}';
	}

	inline public static function blue(s :String) :String
	{
		return '${BLUE}${s}${NC}';
	}

	inline public static function magenta(s :String) :String
	{
		return '${MAGENTA}${s}${NC}';
	}

	inline public static function cyan(s :String) :String
	{
		return '${CYAN}${s}${NC}';
	}

	inline public static function traceRed(s :Dynamic, ?infos :PosInfos)
	{
		haxe.Log.trace(red(s), infos);
	}

	inline public static function traceGreen(s :Dynamic, ?infos :PosInfos)
	{
		haxe.Log.trace(green(s), infos);
	}

	inline public static function traceYellow(s :Dynamic, ?infos :PosInfos)
	{
		haxe.Log.trace(yellow(s), infos);
	}

	inline public static function traceBlue(s :Dynamic, ?infos :PosInfos)
	{
		haxe.Log.trace(blue(s), infos);
	}

	inline public static function traceMagenta(s :Dynamic, ?infos :PosInfos)
	{
		haxe.Log.trace(magenta(s), infos);
	}

	inline public static function traceCyan(s :Dynamic, ?infos :PosInfos)
	{
		haxe.Log.trace(cyan(s), infos);
	}
}