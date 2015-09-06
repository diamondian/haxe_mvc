package com.platinastar.star.mvc.context;
import com.platinastar.star.mvc.patterns.Mediator;
import nme.display.DisplayObject;
import nme.events.Event;
import nme.Lib;
import nme.ObjectHash;

/**
 * ...
 * @author blandon
 */

class MediatorMap 
{
	private var _instanceMediatorMap:ObjectHash<DisplayObject,Mediator>;
	private var _classMediatorMap:ObjectHash<Class<Dynamic>,Class<Dynamic>>;
	public function new() 
	{
		
		_instanceMediatorMap = new ObjectHash<DisplayObject,Mediator>();
		_classMediatorMap = new ObjectHash<Class<Dynamic>,Class<Dynamic>>();
		
		Lib.current.stage.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler, true);
	}
		
	private function addedToStageHandler(e:Event):Void 
	{
		var view:DisplayObject = e.target;
		registerMediator(view);
	}
	
	private function registerMediator(view:DisplayObject) 
	{
		
		if (_instanceMediatorMap.exists(view) == false) {
			var newMediator:Mediator = getMediatorByViewInstance(view);
			
			if(newMediator != null){
				//trace(Type.getInstanceFields(Type.getClass(view)));
				newMediator.onRegister();
			
				_instanceMediatorMap.set(view,newMediator);
			}		
		}
	}
	
	public function mapMediator(viewClass:Class<Dynamic>, mediatorClass:Class<Dynamic>):Void {
		if(_classMediatorMap.exists(viewClass) == false){
			_classMediatorMap.set(viewClass,mediatorClass);
		}
	}
	
	public function getMediatorByViewInstance(view:DisplayObject):Mediator {
		var type = Type.getClass(view);
		var mediatorClass = _classMediatorMap.get(type);
		if (mediatorClass != null) {
			var mediatorInstance:Mediator = Type.createInstance(mediatorClass,[view]);
			return mediatorInstance;
		}
		return null;
	}
	
	public function init():Void {
		//to be override;
	}
}