package com.platinastar.star.testmvc.commands;
import com.platinastar.star.mvc.patterns.exp.AsyncCommand;

/**
 * ...
 * @author blandon
 */

class MyAsyncCommandOne extends AsyncCommand
{

	public function new() 
	{
		super();
	}
	
	override public function execute():Void 
	{
		trace("MyAsyncCommand one executed.");
		onComplete();
	}
	
}