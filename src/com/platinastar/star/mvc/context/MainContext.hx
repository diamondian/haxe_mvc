package com.platinastar.star.mvc.context;

/**
 * ...
 * @author blandon
 */

class MainContext 
{
	private var _mediatorMap:MediatorMap;
	private var _commandFactory:CommandFactory;
	private var _modelFactory:ProxyFactory;
	
	public function new() 
	{
		
	}
	
	public function initFactories(?mediatorMap:MediatorMap,
									?commandFactory:CommandFactory,
									?modelFactory:ProxyFactory):Void{
		if(modelFactory == null){
			_modelFactory = new ProxyFactory();
		}else{
			_modelFactory = modelFactory;
		}
		if(commandFactory == null){
			_commandFactory = new CommandFactory();
		}else{
			_commandFactory = commandFactory;
		}
		if(mediatorMap == null){
			_mediatorMap = new MediatorMap();
		}else{
			_mediatorMap = mediatorMap;
		}
		
		initAll();
	}

	private function initAll():Void {
		_modelFactory.init();
		_commandFactory.init();		
		_mediatorMap.init();		
	}
	
	private function get_mediatorMap():MediatorMap 
	{
		return _mediatorMap;
	}
	
	public var mediatorMap(get_mediatorMap, null):MediatorMap;
	
	private function get_commandFactory():CommandFactory 
	{
		return _commandFactory;
	}
	
	public var commandFactory(get_commandFactory, null):CommandFactory;
	
	private function get_modelFactory():ProxyFactory 
	{
		return _modelFactory;
	}
	
	public var modelFactory(get_modelFactory, null):ProxyFactory;
}