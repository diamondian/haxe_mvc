
package com.platinastar.star.mvc.patterns.role;

import nme.events.EventDispatcher;
import nme.events.Event;
import com.platinastar.star.mvc.Core;

class Dispatcher extends Observer{

	public function new() {	
		super();
	} 

	private function dispatch(event:Event):Void{
		this.messageBus.dispatchEvent(event);
	}


}