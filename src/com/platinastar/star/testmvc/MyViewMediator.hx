
package com.platinastar.star.testmvc;

import com.platinastar.star.mvc.patterns.Mediator; 
import nme.display.Sprite;
import nme.events.Event;

class MyViewMediator extends Mediator {

	private var _view:MyView;

	public function new(viewComponent:Sprite){
		super(viewComponent);
	}

	override public function onRegister():Void{
		this.addContextListenner("iamyourview", caonimaHandler); 
		this.addContextListenner("dataChanged", proxyChangedHandler);
		this.dispatch(new Event("iammyview"));
	}
	
	private function proxyChangedHandler(e:Event) 
	{
		trace("----------- proxy data changed");
	}
	
	private function caonimaHandler(e:Event):Void 
	{
		trace("hello your view!!!");
		this.dispatch(new Event("blandon"));
	}
}