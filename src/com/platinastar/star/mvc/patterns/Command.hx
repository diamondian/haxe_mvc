package com.platinastar.star.mvc.patterns;
import com.platinastar.star.mvc.patterns.role.Operator;
import nme.events.Event;
/**
 * ...
 * @author blandon
 */

class Command extends Operator
{
	public var event:Event;

	public function new() 
	{
		super();
	}

	public function execute():Void{

	}
	
}