
package com.platinastar.star.testmvc.context;

import com.platinastar.star.mvc.context.MediatorMap;
import com.platinastar.star.testmvc.MyView;
import com.platinastar.star.testmvc.MyViewMediator;
import com.platinastar.star.testmvc.YourView;
import com.platinastar.star.testmvc.YourViewMediator;

class MyMediatorMap extends MediatorMap {

	public function new(){
		super();
	}

	override public function init():Void{
		this.mapMediator(MyView, MyViewMediator);
		this.mapMediator(YourView,YourViewMediator);
	}

}