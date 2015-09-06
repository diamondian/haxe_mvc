package com.platinastar.star.testmvc.commands;
import com.platinastar.star.mvc.patterns.exp.AsyncCommand;

/**
 * ...
 * @author blandon
 */

class MyAsyncCommand extends AsyncCommand
{

	public function new() 
	{
		super();
	}
	
	override public function execute():Void 
	{
		trace("MyAsyncCommand executed.");
		onComplete();
	}
	
}