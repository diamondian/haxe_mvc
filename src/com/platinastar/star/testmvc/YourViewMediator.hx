
package com.platinastar.star.testmvc;

import com.platinastar.star.mvc.patterns.Mediator; 
import nme.display.Sprite;
import nme.events.Event;

class YourViewMediator extends Mediator {

	private var _view:YourView;

	public function new(viewComponent:Sprite){
		super(viewComponent);
	}

	override public function onRegister():Void{
		this.addContextListenner("iammyview", caonimaHandler);
	}
	
	private function caonimaHandler(e:Event):Void 
	{
		trace("Nihao my view!!!");
		this.dispatch(new Event("iamyourview"));
	}
}