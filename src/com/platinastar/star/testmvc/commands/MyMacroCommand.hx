package com.platinastar.star.testmvc.commands;
import com.platinastar.star.mvc.patterns.exp.MacroCommand;

/**
 * ...
 * @author blandon
 */

class MyMacroCommand extends MacroCommand
{

	public function new() 
	{
		super();
	}
	override private function initSequence():Void 
	{
		this.insertCommand(MyAsyncCommand);
		this.insertCommand(HelloCommand);
		this.insertCommand(MyAsyncCommandOne);
	}
	
}