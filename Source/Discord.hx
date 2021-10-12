package;
#if !neko
#if desktop
import Sys.sleep;
import discord_rpc.DiscordRpc;
import Random;

using StringTools;

class DiscordClient
{
	public function new()
	{
		trace("Discord Client starting...");
		DiscordRpc.start({
			clientID: "896426966503264277",
			onReady: onReady,
			onError: onError,
			onDisconnected: onDisconnected
		});
		trace("Discord Client started.");

		while (true)
		{
			DiscordRpc.process();
			sleep(2);
			//trace("Discord Client Update");
		}

		DiscordRpc.shutdown();
	}

	public static function shutdown()
	{
		DiscordRpc.shutdown();
	}
	
	static function onReady()
	{
        var alt = '';
        if(Random.bool()){
            alt = '-alt';
        }
        else{
            var uwu:Bool = (Random.int(1,100) == 1);
            if(uwu){
                alt = '-alt2';
            }
            else{
                alt = '';
            }
            trace(alt);
        }
		DiscordRpc.presence({
			details: "just started up",
			state: null,
			largeImageKey: 'haxerune' + alt,
			largeImageText: "HAXERUNE"
		});
	}

	static function onError(_code:Int, _message:String)
	{
		trace('Error! $_code : $_message');
	}

	static function onDisconnected(_code:Int, _message:String)
	{
		trace('Disconnected! $_code : $_message');
	}

	public static function initialize()
	{
		var DiscordDaemon = sys.thread.Thread.create(() ->
		{
			new DiscordClient();
		});
		trace("Discord Client initialized");
	}

	public static function changePresence(details:String, state:Null<String>, ?smallImageKey : String, ?hasStartTimestamp : Bool, ?endTimestamp: Float, ?forcedfunny:Bool = false)
	{
		var startTimestamp:Float = if(hasStartTimestamp) Date.now().getTime() else 0;

		if (endTimestamp > 0)
		{
			endTimestamp = startTimestamp + endTimestamp;
		}
        var alt = '';
        
        if(Random.bool() && !forcedfunny){
            alt = '-alt';
        }
        else{
            var uwu:Bool = (Random.int(1,100) == 1);
            if(uwu || forcedfunny){
                alt = '-alt2';
            }
            else{
                alt = '';
            }
        }
        trace(alt);
		DiscordRpc.presence({
			details: details,
			state: state,
			largeImageKey: 'haxerune' + alt,
			largeImageText: "HAXERUNE",
			smallImageKey : smallImageKey,
			// Obtained times are in milliseconds so they are divided so Discord can use it
			startTimestamp : Std.int(startTimestamp / 1000),
            endTimestamp : Std.int(endTimestamp / 1000)
		});

		//trace('Discord RPC Updated. Arguments: $details, $state, $smallImageKey, $hasStartTimestamp, $endTimestamp');
	}
}
#end
#end