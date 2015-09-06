package com.platinastar.star.mvc.patterns.exp;
import com.platinastar.star.mvc.patterns.Command;

/**
 * ...
 * @author blandon
 */

class MacroCommand extends AsyncCommand 
{
	
	public function new() 
	{
		super();
		initSequence();
	}
	
	override public function execute():Void 
	{
		onComplete();
	}
	
	private function initSequence():Void {
		
	}
	
	private function insertCommand(commandClass:Class<Command>):Void
	{
		var command = Type.createInstance(commandClass, []);		
		this.addNextCommand(command);		
	}
}