package com.platinastar.star.testmvc.context;
import com.platinastar.star.testmvc.commands.HelloCommand;
import com.platinastar.star.mvc.context.CommandFactory;
import com.platinastar.star.testmvc.commands.MyMacroCommand;
/**
 * ...
 * @author blandon
 */

class MyCommandFactory extends CommandFactory
{
	public function new() 
	{
		super();
	}
	
	override public function init():Void {
		this.mapCommand("blandon", MyMacroCommand);
	}
}