package com.platinastar.star.mvc;
import com.platinastar.game.tpow.events.SystemEvent;
import com.platinastar.star.mvc.context.CommandFactory;
import com.platinastar.star.mvc.context.MediatorMap;
import com.platinastar.star.mvc.context.ProxyFactory;
import com.platinastar.star.mvc.patterns.Command;
import com.platinastar.star.mvc.patterns.role.Observer;
import com.platinastar.star.mvc.patterns.role.Operator;
import com.platinastar.star.testmvc.context.MyCommandFactory;
import com.platinastar.star.testmvc.context.MyMediatorMap;
import com.platinastar.star.testmvc.context.MyProxyFactory;
import nme.display.DisplayObject;
import nme.events.Event;
import nme.Lib;
import nme.events.EventDispatcher;
import com.platinastar.star.mvc.patterns.role.Dispatcher;
import com.platinastar.star.mvc.context.MainContext;
import com.platinastar.star.mvc.patterns.Proxy;
/**
 * ...
 * @author blandon
 */

class Core 
{
	public static inline var APPLICATION_START:String = "Core::APPLICATION_START";
	private static var _messageBus:EventDispatcher;
	private static var _mainContext:MainContext;
	
	public function new() 
	{
		_mainContext = new MainContext();
		_messageBus = new EventDispatcher();
	}
	
	public function init(?mediatorMap:MediatorMap,
						 ?commandFactory:CommandFactory,
						 ?modelFactory:ProxyFactory):Void
	{
		_mainContext.initFactories(mediatorMap, commandFactory,modelFactory);
		registerEvents();
		_messageBus.dispatchEvent(new Event(APPLICATION_START));
	}

	public static function getMessageBus(applicant:Observer):EventDispatcher
	{
		return _messageBus;	
	}
	
	public static function getProxyAccess(applicant:Operator):Class<Proxy>->Proxy
	{
		return _mainContext.modelFactory.retrieveProxy;	
	}
	
	private function registerEvents():Void 
	{
		var eventTypes:Array<String> = _mainContext.commandFactory.eventTypesIterator;
		for (propertyName in eventTypes) 
		{
			_messageBus.addEventListener(propertyName, triggerCommandByEvent);
		}
	}
	
	private function triggerCommandByEvent(e:Event):Void 
	{
		var commandInstance:Command = _mainContext.commandFactory.getCommandInstanceByEvent(e);
		if (commandInstance != null) {
			commandInstance.execute();
		}else {
			throw "A command registered by event type:" + e.type + ",but can't be executed!";
		}
	}

	private function systemDispatch(event:Event):Void {
		_messageBus.dispatchEvent(event);
	}

}