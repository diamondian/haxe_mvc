package com.platinastar.star.mvc.patterns.exp;
import com.platinastar.star.mvc.patterns.Command;

/**
 * ...
 * @author blandon
 */

class AsyncCommand extends Command
{
	private var _subsequentCommands:Array<Command>;
	private var _successor:AsyncCommand;
	
	public function new() 
	{
		super();
	}
	
	private function onComplete():Void {
		//trace(this+" .onComplete()");
		if (_subsequentCommands != null) {
			for (i in 0..._subsequentCommands.length) 
			{
				var commandInstance = _subsequentCommands[i];
				if (this.event != null) {
					commandInstance.event = this.event;
				}
				commandInstance.execute();
			}			
		}
	}
	
	public function addNextCommand(command:Command):Void {
		
		if (_subsequentCommands == null) {
			_subsequentCommands = [];
		}
		if (_successor == null) {
			if (Std.is(command, AsyncCommand)) {
				_successor = cast command;
				//trace(this+"  addNextCommand( async: "+command +" )...");
			}else {
				//trace(this+"  addNextCommand( normal"+command +" )...");
			}				
			_subsequentCommands.push(command);
		}else {
			_successor.addNextCommand(command);
		}			
	}	
}