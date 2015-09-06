package com.platinastar.star.testmvc.commands;
import com.platinastar.star.mvc.patterns.Command;
import com.platinastar.star.testmvc.models.MyProxy;

/**
 * ...
 * @author blandon
 */

class HelloCommand extends Command
{
	private var _myProxy:MyProxy;
	public function new() 
	{
		super();
	}
	
	override public function execute():Void{
		trace(this.event.type + " is awesome!!");
		_myProxy = cast this.retrieveProxy(MyProxy);
		trace("HelloCommand is executed.");
		_myProxy.data = 543;
	}
}