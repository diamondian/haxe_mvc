package com.platinastar.star.mvc.patterns.role;
import nme.events.Event;
import com.platinastar.star.mvc.Core;
import nme.events.EventDispatcher;
/**
 * ...
 * @author blandon
 */

class Observer 
{
	private var messageBus:EventDispatcher;

	public function new(){ 
		messageBus = Core.getMessageBus(this);
	}

	private function addContextListenner(eventType:String, handler:Event->Void):Void {
		messageBus.addEventListener(eventType,handler);
	}
}