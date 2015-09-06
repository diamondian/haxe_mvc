package com.platinastar.star.mvc.context;

import com.platinastar.star.mvc.patterns.Command;
import haxe.io.Error;
import nme.events.Event;
import nme.ObjectHash;

/**
 * ...
 * @author blandon
 */

class CommandFactory 
{
	private var _commandMap:Hash<Class<Command>>;
	private var _eventMap:Hash<Class<Event>>;
	private var _oneShotFlagMap:Hash<Bool>;	
	private var _eventTypesIterator:Array<String>;
	
	public function new() 
	{
		_commandMap = new Hash<Class<Command>>();
		_eventMap = new Hash<Class<Event>>();
		_oneShotFlagMap = new Hash<Bool>();
		_eventTypesIterator = [];
	}
	
	public function mapCommand(eventType:String, commandClass:Class<Command>,?eventClass:Class<Event>,unmapAfterTriggered:Bool = false) 
	{
		if (_commandMap.exists(eventType) == true) {
			throw "!!-------Event type :"+eventType+" has been already registered by "+_commandMap.get(eventType);
		}else {
			_commandMap.set(eventType, commandClass);
			_eventTypesIterator.push(eventType);
			if (eventClass != null) {
				_eventMap.set(eventType, eventClass);
			}
			if (unmapAfterTriggered == true) {
				_oneShotFlagMap.set(eventType, true);
			}
		}
	}
	
	public function getCommandInstanceByEvent(event:Event):Command {
		var eventType:String = event.type;
		var eventClass = Type.getClass(event);
		if (_commandMap.exists(eventType)) {
			// Validate event type
			if (_eventMap.exists(eventType) && _eventMap.get(eventType) != eventClass) {
				throw "Event type " + eventType + " defined repeatly in " + eventClass;
				return null;
			}
			var commandClass = _commandMap.get(eventType);
			// Inject the event as dependency of command.
			var command = Type.createInstance(commandClass, []);
			command.event = event;
			
			if (_oneShotFlagMap.exists(eventType)) {
				_commandMap.remove(eventType);
				_eventMap.remove(eventType);
				_oneShotFlagMap.remove(eventType);
			}
			
			return command;
		}
		return null;
	}
	
	public function init():Void {
		
	}
	
	private function get_eventTypesIterator():Array<String> 
	{
		return _eventTypesIterator;
	}
	
	public var eventTypesIterator(get_eventTypesIterator, null):Array<String>;
	
}