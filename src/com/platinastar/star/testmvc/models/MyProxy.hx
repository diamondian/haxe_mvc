package com.platinastar.star.testmvc.models;
import com.platinastar.star.mvc.patterns.Proxy;
import nme.events.Event;

/**
 * ...
 * @author blandon
 */

class MyProxy extends Proxy
{
	private var _data:Int = 6000;	
	
	public function new() 
	{
		super();
	}
	
	private function get_data():Int 
	{ 
		return _data;
	}
	
	private function set_data(value:Int):Int 
	{
		this.dispatch(new Event("dataChanged"));
		return _data = value;
	}
	
	public var data(get_data, set_data):Int;
	
}